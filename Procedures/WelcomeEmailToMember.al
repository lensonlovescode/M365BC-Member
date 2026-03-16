codeunit 50120 "Email Messenger"
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
                    if not Email.Send(EmailMessage, TempEmailAccount) then
                    begin
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
}