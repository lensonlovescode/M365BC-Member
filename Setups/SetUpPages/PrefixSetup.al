page 50109 "Prefix setup page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Prefix;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group("Prefix Code Setup")
            {
                field(Prefix; Rec.Prefix)
                {

                }
                field(Description; Rec.Description)
                {

                }
            }
        }
    }
    actions {
        area(Processing) {
            action("Re-enter")
            {
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}