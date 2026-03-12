table 50107 Gender
{
    Caption = 'Gender types';
    
    fields
    {
        field(1; Gender; Code[20]) {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[50]) {

        }
    }
    
    keys
    {
        key(Gender; Gender)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        Setup: Record Gender;
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