codeunit 50009 SpyApplyCustomerTemplates
{
    Procedure ApplyTemplates(Customer: Code[20]; CountryType: Text[3])
    var
        ConfigTemplateHeader: Record "Config. Template Header";
        CustomerRecRef: RecordRef;
        ConfigTemplateManagement: Codeunit "Config. Template Management";
        CustTemplateManagement: Codeunit "Customer Templ. Mgt.";
        CustTemplateHeader: Record "Customer Templ.";
        Cust: Record Customer;
        DimensionsTemplate: Record "Dimensions Template";
        CT: Text;
        Country: Text;
    begin
        Cust.GET(Customer);
        CustomerRecRef.GETTABLE(Cust);
        Country := Cust."Country/Region Code";
        CT := CountryType;

        // IF CustTemplateHeader.GET('SPYCUS') THEN BEGIN
        //     CustTemplateManagement.ApplyCustomerTemplate(Cust,CustTemplateHeader);
        // END;
        IF ConfigTemplateHeader.GET('SPYCUS') THEN BEGIN
            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);
            DimensionsTemplate.InsertDimensionsFromTemplates(ConfigTemplateHeader, Cust."No.", DATABASE::Customer);
        END;
        IF ConfigTemplateHeader.GET('SPYCUS-' + CountryType) THEN BEGIN
            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);
            DimensionsTemplate.InsertDimensionsFromTemplates(ConfigTemplateHeader, Cust."No.", DATABASE::Customer);
        END;

        IF ConfigTemplateHeader.GET('SPYCUS-' + Country) THEN BEGIN
            ConfigTemplateManagement.UpdateRecord(ConfigTemplateHeader, CustomerRecRef);
            DimensionsTemplate.InsertDimensionsFromTemplates(ConfigTemplateHeader, Cust."No.", DATABASE::Customer);
        END;
        Cust.Modify();
    end;

}