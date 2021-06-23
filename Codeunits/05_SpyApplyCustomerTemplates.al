codeunit 50009 SpyApplyCustomerTemplates
{
    Procedure ApplyTemplates(Customer: Code[20]; CountryType: Text[3])
    var
        ConfigTemplateHeader: Record "Config. Template Header";
        CustomerRecRef: RecordRef;
        ConfigTemplateManagement: Codeunit "Config. Template Management";
        Cust: Record Customer;
        CT: Text;
        Country: Text;
    begin
        Cust.GET(Customer);
        CustomerRecRef.GETTABLE(Cust);
        Country := Cust."Country/Region Code";
        CT := CountryType;

        IF ConfigTemplateHeader.GET('SPYCUS') THEN
            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);

        IF ConfigTemplateHeader.GET('SPYCUS-' + CountryType) THEN
            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);

        IF ConfigTemplateHeader.GET('SPYCUS-' + Country) THEN
            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);
    end;

}