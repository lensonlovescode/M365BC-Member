page 50108 "Member Application List"
{
    PageType = List;
    ApplicationArea = All;
    Editable = false;
    UsageCategory = Administration;
    SourceTable = Member;
    SourceTableView = where(ApprovalStatus = filter(Pending));
    CardPageId = 50105;
    
    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("Member NO";Rec."Member NO") {
                    
                }
                field(FirstName;Rec."First Name") {

                }
                field("Last Name";Rec."Last Name") {

                }
                field(ID;Rec.ID) {

                }
                field(Passport;Rec.Passport) {

                }
                field(Phone;Rec.Phone) {

                }
                field(Gender;Rec.Gender) {

                }
                field(ApprovalStatus;Rec.ApprovalStatus) {

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
        }
        area(Promoted) {
            actionref("Approve all"; ApproveAll) {

            }
        }
    }
}