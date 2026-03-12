page 50108 "Member Application List"
{
    PageType = List;
    ApplicationArea = All;
    Editable = false;
    UsageCategory = Administration;
    SourceTable = Member;
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
                field(Status;Rec.Status) {

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
                Image = Approval;
                trigger OnAction()
                var
                    SelectedRecords: Record Member;
                begin
                    CurrPage.SetSelectionFilter(SelectedRecords);
                    if SelectedRecords.FindSet() then
                        repeat
                            SelectedRecords.ApprovalStatus := ApprovalStatus::Approved;
                            SelectedRecords.Modify();
                        until SelectedRecords.Next() = 0;
                    Message('Members Approved Successfullly!');
                end;
            }
        }
        area(Promoted) {
            actionref("Approve all"; ApproveAll) {

            }
        }
    }
    
    var
        myInt: Integer;
}