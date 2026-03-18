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
                begin
                    CurrPage.SetSelectionFilter(SelectedRecord);
                    if SelectedRecord.FindSet() then
                        repeat
                            SelectedRecord.ApprovalStatus := ApprovalStatus::Approved;
                            SelectedRecord.Modify();
                            EmailMessenger.SendWelcomeEmailToMember(SelectedRecord);
                        until SelectedRecord.Next() = 0;
                    Message('All Members Approved Successfullly!');
                    CurrPage.Update();
                end;
            }
            action(ImportMembers) {
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
            actionref("Import Members"; ImportMembers) {

            }
        }
    }
}