page 50100 "Member Application List"
{
    PageType = List;
    ApplicationArea = All;
    Editable = false;
    UsageCategory = Administration;
    SourceTable = Member;
    SourceTableView = where(ApprovalStatus = filter(Pending));
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("Member NO"; Rec."Member NO")
                {

                }
                field(FirstName; Rec."First Name")
                {

                }
                field("Last Name"; Rec."Last Name")
                {

                }
                field(ID; Rec.ID)
                {

                }
                field(Passport; Rec.Passport)
                {

                }
                field(Phone; Rec.Phone)
                {

                }
                field(Gender; Rec.Gender)
                {

                }
                field(ApprovalStatus; Rec.ApprovalStatus)
                {

                }
            }

        }
    }

    actions
    {
        area(Processing)
        {
            action(ApproveAll)
            {
                Caption = 'Approve all';
                Image = Approval;
                trigger OnAction()
                var
                    SelectedRecord: Record Member;
                    EmailMessenger: Codeunit "Email Messenger";
                    Parameters: Dictionary of [Text, Text];
                    jobQueueEntry: Record "Job Queue Entry";
                    jobQueueEnqueue: Codeunit "Job Queue - Enqueue";
                begin
                    BackgroundTaskRunning := true;
                    // if a user closes the page, all sending emails background tasks will be orphaned and cancelled
                    // also try create a background task in future to enqueue emails that were not sent or are in draft
                    // Alternatively instead of page background tasks, use a job queue
                    // Job Queue to send 1 email every 5 seconds to avoid being flagged as spam by Gmail or Outlook
                    CurrPage.SetSelectionFilter(SelectedRecord);
                    if SelectedRecord.FindSet() then
                        repeat
                            SelectedRecord.ApprovalStatus := SelectedRecord.ApprovalStatus::Approved;
                            SelectedRecord.Modify(false);
                            jobQueueEntry.Init();
                            JobQueueEntry.ID := CreateGuid();
                            jobQueueEntry."Object Type to Run" := jobQueueEntry."Object Type to Run"::Codeunit;
                            jobQueueEntry."Object ID to Run" := Codeunit::"Approve Email";
                            JobQueueEntry."Record ID to Process" := SelectedRecord.RecordId;
                            jobQueueEntry."Earliest Start Date/Time" := CurrentDateTime();
                            jobQueueEntry.Status := jobQueueEntry.Status::Ready;
                            jobQueueEntry.Insert();
                            jobQueueEnqueue.Run(jobQueueEntry);
                            Clear(jobQueueEntry);
                        until SelectedRecord.Next() = 0;
                    Message('All Members Approved Successfullly, Welcome Emails have been enqueued');
                    CurrPage.Update();
                    BackgroundTaskRunning := false;
                end;
            }
            action(ImportMembers)
            {
                Caption = 'Import Members';
                Image = Export;

                trigger OnAction()
                var
                    PrefixRecord: Record Prefix;
                    prefixpage: Page "Prefix setup page";
                begin
                    if not PrefixRecord.Get() then begin
                        if Confirm('You must set a prefix to run the member number series') then begin
                            // RunModal is blocking
                            prefixpage.RunModal();
                        end else
                            CurrPage.Close();
                    end else
                        if PrefixRecord.Prefix = '' then begin
                            if Confirm('Prefix cannot be empty, Please set up a ') then begin
                                prefixpage.RunModal();
                            end else
                                CurrPage.Close();
                        end;
                    // problem here, xml port still runs even after not entering , either Run() or Runmodal()
                    // also the new member still runs even after not entering a prefix
                    Xmlport.Run(Xmlport::"Import Members XMLport", true, true);
                end;
            }
        }
        area(Promoted)
        {
            actionref("Approve all"; ApproveAll)
            {

            }
            actionref("Import Members"; ImportMembers)
            {

            }
        }
    }
    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin

    end;

    trigger OnPageBackgroundTaskError(TaskId: Integer; ErrorCode: Text; ErrorText: Text; ErrorCallStack: Text; var IsHandled: Boolean)
    begin

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if BackgroundTaskRunning then //set this when EnqueueBackgroundTask is called
            if not Confirm('An approval process is still running in the background. Closing this page will cancel it. Do you want to close anyway?') then
                exit(false); // This stops the page from closing
    end;

    trigger OnOpenPage()
    begin
        BackgroundTaskRunning := false;
    end;

    var
        BackGroundTaskID: Integer;
        BackgroundTaskRunning: Boolean;
}