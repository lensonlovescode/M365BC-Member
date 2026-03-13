table 50108 Prefix
{
    Caption = 'Member Number Series Prefix';
    
    fields
    {
        field(1; "No."; Text[30])
        {
            InitValue = 'Member';
        }
        field(2; Prefix; Code[20]) {

            TableRelation = "No. Series".Code;
            Caption = 'Prefix Code';
            NotBlank = true;
            trigger OnValidate()
            var
                MemberTable: Record Member;
            begin
                if not MemberTable.IsEmpty then
                    Error('Code cannot be changed with existing members for consistency');
            end;
        }
        field(3; Description; Text[100]) {
            Caption = 'Description';
        }
        field(4; "Starting Date"; Date)
        {
            Caption = 'Starting Date';            
        }
        field(5; "Starting No."; Code[20])
        {
            Caption = 'Starting No.';
        }
        field(6; "Ending No."; Code[20])
        {
            Caption = 'Ending No.';
        }
        field(7; "Increment-by No."; Integer)
        {
            Caption = 'Increment-by No.';
            InitValue = 1;
            MinValue = 1;
        }
        field(8; "Last No. Used"; Code[20])
        {
            Caption = 'Last No. Used';
        }
    }
    
    keys
    {
        key(No; "No.")
        {
            Clustered = true;
        }
    }
    
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