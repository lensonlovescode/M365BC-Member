page 50110 "Gender Setup page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Gender;    

    layout
    {
        area(Content)
        {
            group("Gender Set up")
            {
                field(Gender;Rec.Gender)
                {
                    
                }
                field(Description;Rec.Description) {

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