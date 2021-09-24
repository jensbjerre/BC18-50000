page 50092 SpyFieldsPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Field;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(TableNo; Rec.TableNo)
                {
                    ApplicationArea = All;

                }
                field(TableName; Rec.TableName)
                {
                    ApplicationArea = All;

                }
                field(FieldNo; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(FieldName; Rec.FieldName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}