page 50105 "Member Single"
{
    PageType = Card;
    Editable = true;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Member;
    
    layout
    {
        area(Content)
        {
            group("Basic Info")
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
                field(Gender; Rec.Gender) {

                }

            }
            group("Contact Details") {
                field(Phone;Rec.Phone) {

                }
                field("E-mail";Rec."E-mail") {

                }
                field(Address;Rec.Address) {
                    
                }
            }
            group("Cooperative Financial Fields") {
                field("Share Capital"; Rec."Share Capital") {

                }
                field("Loan Balance";Rec."Loan Balance") {

                }
                field("Total Deposits";Rec."Total Deposits") {

                }                
            }
            group("Employment & Income") {

                field("Source Income";Rec."Source Income") {

                }
                field("employer Name";Rec."employer Name")
                {

                }
            }
            group("Beneficiaries & Next of kin") {
                field("Nominee Name"; Rec."Nominee Name") {

                }
                field(Relationship; Rec.Relationship) {

                }
                field(Allocation; Rec.Allocation) {

                }
            }
        }
    }
    
    
    actions
    {
        area(Promoted) {
            actionref("Export PDF"; "Export as PDF") {

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
        }
        area(Navigation) {

        }
    }
    
    var
        myInt: Integer;
}