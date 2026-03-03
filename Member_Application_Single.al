page 50108 "Member Application Single"
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
                field("Member NO"; Rec."Member NO")
                {
                    
                }
                field(FirstName;Rec.FirstName) {

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