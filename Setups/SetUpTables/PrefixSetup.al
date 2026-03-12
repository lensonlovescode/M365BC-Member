table 50108 Prefix
{
    Caption = 'Member Number Series Prefix';
    
    fields
    {
        field(1; "No."; Integer)
        {
        }
        field(2; Prefix; Code[20]) {

        }
        field(3; Description; Text[50]) {

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