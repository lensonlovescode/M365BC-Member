table 50104 Member
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Member NO"; Text[30]) {
            Caption = 'Member number';

        }
        field(2; "FirstName"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Middle Name"; Text[30]) {
            DataClassification = CustomerContent;
        }
        field(4; "Last Name"; Text[30]) {
            DataClassification = CustomerContent;
        }
        field(5; "ID"; Text[8]) {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Validator: Codeunit FieldValidator;
            begin
                if not Validator.CheckID(Rec.ID) then
                    Error('Incorrect Id format');
            end;

        }
        field(6; "Passport"; Integer) {
            Caption = 'Passport Number';
            DataClassification = CustomerContent;

        }
        field(50106; Gender; Enum Gender) {
            Caption = 'Gender';
            DataClassification = CustomerContent;
        }
        field(7; "DOB"; Date) {
            Caption = 'Date of Birth';
            DataClassification = CustomerContent;
        }
        field(8; KRA; Text[11]) {
            Caption = 'KRA PIN';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Validator: Codeunit FieldValidator;
            begin
                if not Validator.CheckKRAPin(Rec.KRA) then
                    Error('Incorrect KRA Pin format');
            end;
        }
        field(9; "Passport Photo"; Media) {
            Caption = 'Passport Photo';
        }
        field(10; "Phone"; Text[10]) {
            Caption = 'Primary Phone Number';
            DataClassification = CustomerContent;

            trigger onValidate()
            var
                FieldValidator: Codeunit FieldValidator;
            begin
                if not FieldValidator.CheckPhone(Rec.Phone) then
                    Error('Incorrect Phone number format: Use 07XXXXXXXX');
            end;
            
        }
        field(11; "E-mail"; Text[40]) {

        }
        field(12; "Address"; Text[100]) {
            Caption = 'Physical Address';
            DataClassification = CustomerContent;
        }
        field(13; "Postal Code"; Text[20]) {
            Caption = 'Postal Code / ZIP Code';
            DataClassification = CustomerContent;
        }
        field(14; "Share Capital"; Integer) {
            Caption = 'Share Capital';
            DataClassification = AccountData;
        }
        field(15; "Total Deposits"; Integer) {
            Caption = 'Total Deposits';

        }
        field(16; "Loan Balance"; Integer) {

        }
        field(17; "employer Name"; Text[60]) {
            
        }
        field(18; "Source Income"; Text[100]) {

        }
        field(19; "Nominee Name"; Text[30]) {

        }
        field(20; "Relationship"; Text[20]) {

        }
        field(21; "Allocation"; Text[20]) {

        }
        field(22; "Status"; Enum AccStatus) {

        }
        field(23; "Registration Date"; Date) {

        }
        field(24; Blocked; Boolean) {
            Description = 'A boolean to prevent transactions if there are issues with the members account.';
            ToolTip = 'A boolean to prevent transactions if there are issues with the members account.';
            InitValue = false;
        }
    }
    
    keys
    {
        key(PK; "Member NO")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}