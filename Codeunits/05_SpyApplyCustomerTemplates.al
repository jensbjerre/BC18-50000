codeunit 50009 SpyApplyCustomerTemplates
{
    Procedure ApplyTemplates(Customer: Code[20]; CountryType: Text[3])
    var
        ConfigTemplateHeader: Record "Config. Template Header";
        CustomerRecRef: RecordRef;
        ConfigTemplateManagement: Codeunit "Config. Template Management";
        Cust: Record Customer;
        DimensionsTemplate: Record "Dimensions Template";
        Country: Text;
    begin
        Cust.GET(Customer);
        CustomerRecRef.GETTABLE(Cust);
        Country := Cust."Country/Region Code";

        IF ConfigTemplateHeader.GET('SPYCUS') THEN BEGIN

            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);
            DimensionsTemplate.InsertDimensionsFromTemplates(ConfigTemplateHeader, Cust."No.", DATABASE::Customer);

        END;
        IF ConfigTemplateHeader.GET('SPYCUS-' + UpperCase(CountryType)) THEN BEGIN

            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);
            DimensionsTemplate.InsertDimensionsFromTemplates(ConfigTemplateHeader, Cust."No.", DATABASE::Customer);

        END;

        IF ConfigTemplateHeader.GET('SPYCUS-' + UpperCase(Country)) THEN BEGIN

            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);
            DimensionsTemplate.InsertDimensionsFromTemplates(ConfigTemplateHeader, Cust."No.", DATABASE::Customer);

        END;
    end;

}