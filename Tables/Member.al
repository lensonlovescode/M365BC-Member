table 50104 Member
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Prefix; Enum Prefix) {
            DataClassification = SystemMetadata;
            Caption = 'Member Type';
        }
        field(2; "Member NO"; Code[20]) {
            DataClassification = SystemMetadata;
            Caption = 'Member number';
        }
        field(3; "First Name"; Text[30])
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(4; "Middle Name"; Text[30]) {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(5; "Last Name"; Text[30]) {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(6; "ID"; Text[8]) {
            DataClassification = EndUserIdentifiableInformation;
            trigger OnValidate()
            var
                Validator: Codeunit FieldValidator;
            begin
                if not Validator.CheckID(Rec.ID) then
                    Error('Incorrect Id format');
            end;

        }
        field(7; "Passport"; Integer) {
            Caption = 'Passport Number';
            DataClassification = EndUserIdentifiableInformation;

        }
        field(50106; Gender; Enum Gender) {
            Caption = 'Gender';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(8; "DOB"; Date) {
            Caption = 'Date of Birth';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(9; KRA; Text[11]) {
            Caption = 'KRA PIN';
            DataClassification = EndUserIdentifiableInformation;

            trigger OnValidate()
            var
                Validator: Codeunit FieldValidator;
            begin
                if not Validator.CheckKRAPin(Rec.KRA) then
                    Error('Incorrect KRA Pin format');
            end;
        }
        field(10; "Passport Photo"; Media) {
            DataClassification = EndUserIdentifiableInformation;
            Caption = 'Passport Photo';
        }
        field(11; "Phone"; Text[10]) {
            Caption = 'Primary Phone Number';
            DataClassification = EndUserIdentifiableInformation;

            trigger onValidate()
            var
                FieldValidator: Codeunit FieldValidator;
            begin
                if not FieldValidator.CheckPhone(Rec.Phone) then
                    Error('Incorrect Phone number format: Use 07XXXXXXXX');
            end;
            
        }
        field(12; "E-mail"; Text[40]) {
            Caption = 'Primary E-mail adress';
            DataClassification = EndUserIdentifiableInformation;

        }
        field(13; "Address"; Text[100]) {
            Caption = 'Physical Address';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(14; "Postal Code"; Text[20]) {
            Caption = 'Postal Code / ZIP Code';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(15; "Share Capital"; Integer) {
            Caption = 'Share Capital';
            DataClassification = AccountData;
            Editable = false;
        }
        field(16; "Total Deposits"; Integer) {
            Caption = 'Total Deposits';
            DataClassification = AccountData;
            Editable = false;

        }
        field(17; "Loan Balance"; Integer) {
            Caption = 'Total Loan Balance';
            DataClassification = AccountData;
            Editable = false;

        }
        field(18; "employer Name"; Text[60]) {
            Caption = 'Employer Name';
            DataClassification = EndUserIdentifiableInformation;
            
        }
        field(19; "Source Income"; Text[100]) {
            Caption = 'Primary Source of Income';
            DataClassification = EndUserIdentifiableInformation;

        }
        field(20; "Nominee Name"; Text[30]) {
            Caption = 'Beneficiary name';
            DataClassification = EndUserIdentifiableInformation;

        }
        field(21; "Relationship"; Text[20]) {
            Caption = 'Relationship with the beneficiary';
            DataClassification = EndUserIdentifiableInformation;

        }
        field(22; "Allocation"; Text[20]) {
            Caption = 'Total allocation in percentage';
            DataClassification = EndUserIdentifiableInformation;

        }
        field(23; "Status"; Enum AccStatus) {
            Caption = 'Account Status';
            DataClassification = EndUserIdentifiableInformation;
            InitValue = Registered;
            Editable = false;

        }
        field(24; "Registration Date"; Date) {
            Caption = 'Date of Account registration';
            DataClassification = EndUserIdentifiableInformation;

        }
        field(25; Blocked; Boolean) {
            Description = 'A boolean to prevent transactions if there are issues with the members account.';
            ToolTip = 'A boolean to prevent transactions if there are issues with the members account.';
            InitValue = false;
        }
        field(26; ApprovalStatus; Enum ApprovalStatus) {
            InitValue = Pending;
            DataClassification = ToBeClassified;
            Caption = 'An enum field that defines displayed in the Members page';
            ToolTip = 'An enum field that defines displayed in the Members page';
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
    var
        NumberSeriesHelper: Codeunit "No. Series";
        PrefixToUse: Enum Prefix;
        currentDate: Date;
        usageDate: Date;
    begin
        currentDate := Today();
        usageDate := currentDate + 365;
        if "Member NO" = '' then begin
            PrefixToUse := Rec.Prefix;
            Rec."Member NO" := NumberSeriesHelper.GetNextNo(Format(PrefixToUse), usageDate, true);
        end;
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