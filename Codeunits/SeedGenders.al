codeunit 50107 "Install Genders"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    var
        Gender: Record Gender;
        dictkeys: List of [Code[20]];
        currentKey: Code[20];
        currentValue: Text[30];
        GenderNamesAndDescriptions: Dictionary of [CODE[20], Text[100]];
    begin
        GenderNamesAndDescriptions.Add('MALE', 'Male');
        GenderNamesAndDescriptions.Add('FEMALE', 'Female');
        dictkeys := GenderNamesAndDescriptions.Keys();

        foreach currentKey in dictkeys do begin
            currentValue := GenderNamesAndDescriptions.Get(currentKey);
            Gender.Init();
            Gender.Gender := currentKey;
            Gender.Description := currentValue;
            Gender.Insert(true);
            Clear(Gender);
        end;


    end;
}