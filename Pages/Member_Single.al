page 50113 "Member Single List"
{
    PageType = List;
    ApplicationArea = All;
    Editable = false;
    UsageCategory = Administration;
    SourceTable = Member;
    SourceTableView = where(ApprovalStatus = const(ApprovalStatus::Approved));

    
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
            }

        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                
                trigger OnAction()
                begin

                end;
            }
        }
    }
    
    var
        myInt: Integer;
}