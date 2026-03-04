enum 50111 ApprovalStatus
{
    Extensible = true;
    
    value(0; Pending) {
        Caption = 'Not yet approved';
    }
    value(1; Approved) {
        Caption = 'Approved to be displayed in members application single';

    }
    value(2; Rejected) {
        Caption = 'Rejected';
    }
}