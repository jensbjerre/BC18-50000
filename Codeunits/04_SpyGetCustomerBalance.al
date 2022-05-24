codeunit 50008 SpyCalcCustomerBalance
{

    trigger OnRun()
    begin

    end;

    [ServiceEnabled]
    procedure calcCustomerBalance()
    var
        cust: record Customer;
    begin

        cust.CalcFields("Balance (LCY)", "Balance Due (LCY)");
        cust.FindSet();

    end;

    var

}