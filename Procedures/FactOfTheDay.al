codeunit 50127 FactOfTheDay
{
    procedure GetFact(): Text
    var
        Client: HttpClient;
        HttpRequestMessage: HttpRequestMessage;
        RequestHeaders: HttpHeaders;
        IsSuccessfull: Boolean;
        ErrorInfoObject: ErrorInfo;
        ServiceCallErr: Label 'Web Service call failed';
        Response: HttpResponseMessage;
        ResponseText: Text;

    begin
        HttpRequestMessage.SetRequestUri('https://api.api-ninjas.com/v1/facts');
        HttpRequestMessage.Method('GET');
        HttpRequestMessage.GetHeaders(RequestHeaders);
        RequestHeaders.Add('X-Api-Key', 'atLWYqJJ95NfyMJgq4fcD4uYqA7kbDV7CW8aXymy');

        IsSuccessfull := Client.Send(HttpRequestMessage, Response);

        if not IsSuccessfull then begin
            ErrorInfoObject.DetailedMessage := 'Sorry, Could not find a random fact :(';
            ErrorInfoObject.Message := ServiceCallErr;
            Error(ErrorInfoObject);
        end;
        Response.Content().ReadAs(ResponseText);
        exit(ResponseText);
    end;

}