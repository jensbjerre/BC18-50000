permissionset 50080 SpyPermissionSet
{
    Assignable = true;
    //IncludedPermissionSets = SomePermissionSet;
    Permissions =
        page SpyListJournalBatches = X,
        page SpyCustLedgerPage = X,
        page SpyDefaultDimension = X,
        page SpyFieldsPage = X,
        page SpyJournalPage = X,
        page SpyPostCode = X,
        page SpyTempJournalLines = X,
        page SpyTemplateLine = X,
        page SpyVendLedgerPage = X,
        page SpyCustomerList = X,
        codeunit SpyCalcCustomerBalance = X,
        codeunit SpyCreateJournalLine = X,
        codeunit SpyInstallCodeUnit = X,
        codeunit SpyUpgradeCodeunit = X,
        xmlport SpyCustomerBalance = X,
        xmlport SpyXmlCreateJournalLine = X;


}