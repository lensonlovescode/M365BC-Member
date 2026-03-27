codeunit 50105 "Enqueue Approval Email" 
// main purpose is to add or enqueue send email jobs to the queue list, does not work because PBT
// do not want insert operations
{
    trigger OnRun()
    var
        Parameters: Dictionary of [Text, Text];
        SelectedRecord: Record Member;
        EmailMessenger: Codeunit "Email Messenger";
        jobQueueEntry: Record "Job Queue Entry";
        jobQueueEnqueue: Codeunit "Job Queue - Enqueue";
        jobQueueNotification: Codeunit "Job Queue - Send Notification";
    begin
        Parameters := Page.GetBackgroundParameters();
        SelectedRecord.Get(Parameters.Get('Member NO'));
        jobQueueEntry.Init();
        jobQueueEntry."Object Type to Run" := jobQueueEntry."Object Type to Run"::Codeunit;
        jobQueueEntry."Object ID to Run" := Codeunit::"Approve Email";
        JobQueueEntry."Record ID to Process" := SelectedRecord.RecordId;
        jobQueueEntry."Earliest Start Date/Time" := CurrentDateTime();
        jobQueueEntry.Status := jobQueueEntry.Status::Ready;
        jobQueueEntry.Insert();
        jobQueueEnqueue.Run(jobQueueEntry);
    end;
}