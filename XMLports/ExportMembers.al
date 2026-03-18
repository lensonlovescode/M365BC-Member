xmlport 50127 "Export Member XMLport"
{
    Caption = 'Member XML port';
    Format = Xml;
    Direction = Export;
    // FieldSeparator = ',';
    // TextEncoding = UTF8;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Member; Member)
            {
                fieldelement(FirstName; Member."First Name")
                {
                }
                fieldelement(LastName; Member."Last Name")
                {
                }
                fieldelement(MemberCategory; Member.Prefix)
                {
                }
                fieldelement(IDNumber; Member.ID)
                {
                }
                fieldelement(PhoneNumber; Member.Phone)
                {
                }
                fieldelement(Email; Member."E-mail")
                {
                }
                fieldelement(Status; Member.Status)
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
