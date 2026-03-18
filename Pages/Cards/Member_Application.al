page 50101 "Member Application Card"
{
    PageType = Card;
    Editable = true;
    ApplicationArea = All;
    SourceTable = Member;

    layout
    {
        area(Content)
        {
            group("Basic Info")
            {
                field(FirstName; Rec."First Name")
                {

                }
                field("Last Name"; Rec."Last Name")
                {

                }
                field(ID; Rec.ID)
                {

                }
                field(Gender; Rec.Gender)
                {

                }
                field(KRA; Rec.KRA)
                {

                }
                field(DOB; Rec.DOB)
                {

                }
                field(Passport; Rec.Passport)
                {

                }

            }
            group("Contact Details")
            {
                field(Phone; Rec.Phone)
                {

                }
                field("E-mail"; Rec."E-mail")
                {

                }
                field(Address; Rec.Address)
                {

                }
            }
            group("Cooperative Financial Fields")
            {
                field("Share Capital"; Rec."Share Capital")
                {

                }
                field("Loan Balance"; Rec."Loan Balance")
                {

                }
                field("Total Deposits"; Rec."Total Deposits")
                {

                }
            }
            group("Employment & Income")
            {

                field("Source Income"; Rec."Source Income")
                {

                }
                field("employer Name"; Rec."employer Name")
                {

                }
            }
            group("Beneficiaries & Next of kin")
            {
                field("Nominee Name"; Rec."Nominee Name")
                {

                }
                field(Relationship; Rec.Relationship)
                {

                }
                field(Allocation; Rec.Allocation)
                {

                }
            }
        }
    }


    actions
    {
        area(Promoted)
        {
            actionref("Export PDF"; "Export as PDF")
            {

            }
        }
        area(Processing)
        {
            action("Export as PDF")
            {

                trigger OnAction()
                begin
                    Message('Export as PDF coming soon');
                end;
            }
            action("Fact of the Day")
            {
                trigger OnAction()
                var
                    FactOfTheDay: codeunit 50102;
                    Fact: Text;
                begin
                    Fact := FactofTheDay.GetFact();
                    Message(Fact);
                end;
            }
        }
        area(Navigation)
        {

        }
    }
    trigger OnOpenPage()
    var
        PrefixRecord: Record Prefix;
        prefixpage: Page "Prefix setup page";
    begin
        if not PrefixRecord.Get() then begin
            if Confirm('You must set a prefix to run the member number series') then begin
                prefixpage.RunModal();
            end else
                CurrPage.Close();

        end else
            if PrefixRecord.Prefix = '' then begin

                if Confirm('Prefix cannot be empty, Please set up a ') then begin
                    prefixpage.RunModal();
                end else
                    CurrPage.Close();

            end;

    end;
}