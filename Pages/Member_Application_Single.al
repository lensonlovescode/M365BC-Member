page 50108 "Member Application Single List"
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
    }
    
    var
        myInt: Integer;
}