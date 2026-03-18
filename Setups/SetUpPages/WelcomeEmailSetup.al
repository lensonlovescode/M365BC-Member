page 50103 WelcomeEmailSetupPage
// Next iteration, make it have multiple possibilities, multiple records for diferrent email sends
{
    PageType = Card;
    Caption = 'Welcome Email Setup Page';
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = WelcomeEmailSetupTable;
    InsertAllowed = false;
    DeleteAllowed = false;
    
    layout
    {
        area(Content)
        {
            group("Email format editor")
            {
                field("Email format"; EmailBodyVar)
                {
                    ExtendedDatatype = RichContent;
                    MultiLine = true;
                    
                    trigger OnValidate()
                    begin
                        Rec.SaveRichText(EmailBodyVar);
                    end;
                    
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(Showmehow)
            {
                Image = AboutNav;
                Caption = 'Sample format';
                trigger OnAction()
                begin
                    Message('This is a sample email format to member with member ID {Member ID} and first Name {First Name} ');
                end;
            }
        }
        area(Promoted) {
            actionref("Show me how"; ShowMeHow) {

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        EmailBodyVar := Rec.GetRichText();
    end;

    trigger OnOpenPage()
    begin
        if not Rec.get() then
        begin
            rec.Init();
            rec.Insert();
        end;
    end;
    
    var
        EmailBodyVar: Text;
}