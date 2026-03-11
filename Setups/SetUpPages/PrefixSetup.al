page 50109 "Prefix setup page"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Prefix;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Prefix;Rec.Prefix)
                {
                    
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