table 50108 Prefix
{
    Caption = 'Member Number Series Prefix';
    
    fields
    {
        field(1; Prefix; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    
    keys
    {
        key(Prefix; Prefix)
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