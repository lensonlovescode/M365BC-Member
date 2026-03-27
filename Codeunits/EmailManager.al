codeunit 50101 "Email Messenger"
{
    procedure SendWelcomeEmailToMember(Member: Record Member)
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        EmailAccount: Codeunit "Email Account";
        TempEmailAccount: Record "Email Account" temporary;
        Subject: Text[100];
        Body: Text;
    begin

        if (Member."E-mail" = '') or (Member."First Name" = '') then
            exit;
        Subject := 'Welcome to the SACCO - Regisration Confirmed';
        Body := 'Dear ' + Member."First Name" + ' ' + Member."Last Name" + ',<br/><br/>'; // Full Name
        Body += 'Congratulations your membership has been approved <br/>';
        Body += 'Your Member ID is: ' + Member."Member NO" + '. <br/>'; //Member ID
        Body += 'You can now access your account and apply for loans. <br/><br/>';
        Body += 'Best regards,<br/>';
        Body += 'The SACCO Team';

        EmailMessage.Create(Member."E-mail", Subject, Body, true);
        EmailAccount.GetAllAccounts(true, TempEmailAccount); // EmailAccount is a codeunit, TempEmailAccount is a temporray record
        if not Email.Send(EmailMessage) then begin
            if TempEmailAccount.FindSet() then begin
                repeat
                    if not Email.Send(EmailMessage, TempEmailAccount) then begin
                        continue;
                    end else begin
                        exit;
                    end;
                until TempEmailAccount.Next() = 0;
                // save failed emails to a table, and save all as draft (next git push iteration)
                Email.SaveAsDraft(EmailMessage);
            end;
        end else
            exit;
    end;

    procedure SendRejectionEmailToMember(Member: Record Member)
    var
        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;
        Subject: Text[100];
        Body: Text;
    begin
        if (Member."E-mail" = '') or (Member."First Name" = '') then
            exit;
        Subject := 'Application not approved - Action required';

        Body += FindReplaceRejectionEmailSetup(Body, Member);

        EmailMessage.Create(Member."E-mail", Subject, Body, true);
        if not Email.Send(EmailMessage) then
            Message('Member created successfully, but the welcome email could not be sent. Please check Email Account setup (search "Email Accounts")');
    end;

    procedure FindReplaceWelcomeEmailSetup(EmailText: Text; Member: Record Member): Text
    var
        WelcomeEmailSetupRecord: Record WelcomeEmailSetupTable;
        EmailBody: Text;
    begin
        if not WelcomeEmailSetupRecord.FindFirst() then
            exit(EmailText);

        EmailBody := WelcomeEmailSetupRecord.GetRichText();

        EmailBody := EmailBody.Replace('{Member ID}', Member."Member NO");
        EmailBody := EmailBody.Replace('{First Name}', Member."First Name");
        EmailBody := EmailBody.Replace('{Last Name}', Member."Last Name");
        EmailBody := EmailBody.Replace('{Email}', Member."E-mail");
        EmailBody := EmailBody.Replace('{Phone Number}', Member.Phone);
        EmailBody := EmailBody.Replace('{Date of Birth}', Format(Member.DOB));
        EmailBody := EmailBody.Replace('{Address}', Member."Address");
        EmailBody := EmailBody.Replace('{Postal Code}', Member."Postal Code");
        EmailBody := EmailBody.Replace('{ID/Passport Number}', Member.ID);
        EmailBody := EmailBody.Replace('{Registration Date}', Format(Member."Registration Date"));
        EmailBody := EmailBody.Replace('{Member Status}', Format(Member."Status"));
        EmailBody := EmailBody.Replace('{Member Category}', Member.Prefix);

        exit(EmailBody);
    end;

    procedure FindReplaceRejectionEmailSetup(EmailText: Text; MemberRejected: Record Member): Text
    var
        RejectionEmailSetupRecord: Record RejectionEmailSetupTable;
        EmailBody: Text;
    begin
        if not RejectionEmailSetupRecord.FindFirst() then
            exit(EmailText);

        EmailBody := RejectionEmailSetupRecord.GetRichText();

        EmailBody := EmailBody.Replace('{First Name}', MemberRejected."First Name");
        EmailBody := EmailBody.Replace('{Last Name}', MemberRejected."Last Name");
        EmailBody := EmailBody.Replace('{Email}', MemberRejected."E-mail");
        EmailBody := EmailBody.Replace('{Phone Number}', MemberRejected.Phone);
        EmailBody := EmailBody.Replace('{Date of Birth}', Format(MemberRejected.DOB));
        EmailBody := EmailBody.Replace('{Address}', MemberRejected."Address");
        EmailBody := EmailBody.Replace('{Postal Code}', MemberRejected."Postal Code");
        EmailBody := EmailBody.Replace('{ID Number}', MemberRejected.ID);
        EmailBody := EmailBody.Replace('{Application Date}', Format(MemberRejected."Registration Date"));
        EmailBody := EmailBody.Replace('{Member Category}', MemberRejected.Prefix);

        exit(EmailBody);
    end;
}
