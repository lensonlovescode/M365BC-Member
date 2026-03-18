xmlport 50100 "Import Members XMLport"
// Member Category validation - existing(BUSINESS, DORMANT, GROUP, INSTITUTIONAL, REGULAR ,SENIOR, STUDENT)
// Generate Member Application's "Application ID"
// Link the above ID to PK "Member ID" on the member table
// 
{
    Caption = 'Import Members XMLport';
    Format = VariableText;
    Direction = Import;
    FieldSeparator = ',';
    TextEncoding = UTF8;
    schema
    {
        textelement(RootNodeName)
        {


            tableelement(Member; Member)
            {
                AutoSave = true;
                fieldelement(FirstName; Member."First Name")
                {
                }
                fieldelement(MiddleName; Member."Middle Name")
                {
                }
                fieldelement(LastName; Member."Last Name")
                {
                }
                fieldelement(ID; Member.ID)
                {
                }
                fieldelement(Passport; Member.Passport)
                {
                }
                fieldelement(Gender; Member.Gender)
                {
                }
                fieldelement(DOB; Member.DOB)
                {
                }
                fieldelement(KRA; Member.KRA)
                {
                }
                fieldelement(Phone; Member.Phone)
                {
                }
                fieldelement(Email; Member."E-mail")
                {
                }
                fieldelement(Address; Member.Address)
                {
                }
                fieldelement(PostalCode; Member."Postal Code")
                {
                }
                fieldelement(EmployerName; Member."employer Name")
                {
                }
                fieldelement(SourceIncome; Member."Source Income")
                {
                }
                fieldelement(NomineeName; Member."Nominee Name")
                {
                }
                fieldelement(Relationship; Member.Relationship)
                {
                }
                fieldelement(Allocation; Member.Allocation)
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
