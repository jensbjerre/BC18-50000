pageextension 50081 SpyLedJourBatchExt extends 251
{
    layout
    {
        addlast(Content)
        {
            field("Journal Template Name"; Rec."Journal Template Name")
            {
                Caption = 'Journal Template Name';
                ApplicationArea = All;

            }
            field("Template Type"; Rec."Template Type")
            {
                Caption = 'Template Type';
                ApplicationArea = All;
            }
        }

    }
}