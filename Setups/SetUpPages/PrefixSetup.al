page 50102 "Prefix setup page"
// Issues
// What if i insert and loose focus (onValidate runs when the field looses focus) and delete
// will it also delete in the number series and number series line tables?
//
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
                    // Question: when i add onValidate here it does not work but it works on the table field
                }
                field(Description; Rec.Description)
                {
                    trigger OnValidate()
                    var
                        NoSeriesLineRecord: Record "No. Series";
                    begin
                        NoSeriesLineRecord.SetRange(Code, Rec.Prefix);
                        if NoSeriesLineRecord.FindFirst() then
                            NoSeriesLineRecord.validate(Description, Rec.Description);
                        NoSeriesLineRecord.Modify(true);
                    end;

                }
                field("Starting Date"; Rec."Starting Date")
                {
                    trigger OnValidate()
                    var
                        NoSeriesLineRecord: Record "No. Series Line";
                    begin
                        NoSeriesLineRecord.SetRange("Series Code", Rec.Prefix);
                        if NoSeriesLineRecord.FindFirst() then
                            NoSeriesLineRecord.validate("Starting Date", Rec."Starting Date");
                        NoSeriesLineRecord.Modify(true);
                    end;
                }
                field("Starting No."; Rec."Starting No.")
                {
                    trigger OnValidate()
                    var
                        NoSeriesLineRecord: Record "No. Series Line";
                    begin
                        NoSeriesLineRecord.SetRange("Series Code", Rec.Prefix);
                        if NoSeriesLineRecord.FindFirst() then
                            NoSeriesLineRecord.validate("Starting No.", Rec."Starting No.");
                        NoSeriesLineRecord.Modify(true);
                    end;

                }
                field("Ending No."; Rec."Ending No.")
                {
                    trigger OnValidate()
                    var
                        NoSeriesLineRecord: Record "No. Series Line";
                    begin
                        NoSeriesLineRecord.SetRange("Series Code", Rec.Prefix);
                        if NoSeriesLineRecord.FindFirst() then
                            NoSeriesLineRecord.validate("Ending No.", Rec."Ending No.");
                        NoSeriesLineRecord.Modify(true);
                    end;

                }
                field("Increment-by No."; Rec."Increment-by No.")
                {
                    trigger OnValidate()
                    var
                        NoSeriesLineRecord: Record "No. Series Line";
                    begin
                        NoSeriesLineRecord.SetRange("Series Code", Rec.Prefix);
                        if NoSeriesLineRecord.FindFirst() then
                            NoSeriesLineRecord.validate("Increment-by No.", Rec."Increment-by No.");
                        NoSeriesLineRecord.Modify(true);
                    end;

                }
                field("Last No. Used"; Rec."Last No. Used")
                {
                    trigger OnValidate()
                    var
                        NoSeriesLineRecord: Record "No. Series Line";
                    begin
                        NoSeriesLineRecord.SetRange("Series Code", Rec.Prefix);
                        if NoSeriesLineRecord.FindFirst() then
                            NoSeriesLineRecord.validate("Last No. Used", Rec."Last No. Used");
                        NoSeriesLineRecord.Modify(true);
                    end;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Re-enter")
            {
                trigger OnAction()
                begin
                    Message('Re-enter coming soon for you to Re-Enter values');
                end;
            }
        }
        area(Promoted)
        {
            actionref("Re-Enter Values"; "Re-enter")
            {
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