codeunit 50010 SpyInsertPostCode
{
    Procedure InsertPostCode(Country: Code[10]; City: Text[30]; PostCode: Code[20])
    var
        PostRec: Record "Post Code";

    begin
        IF (Country <> '') AND (City <> '') AND (PostCode <> '') THEN BEGIN
            //PostRec.SETFILTER(PostRec."Country/Region Code",Country);
            PostRec.SETFILTER(PostRec.City, '%1', City);
            PostRec.SETFILTER(PostRec.Code, '%1', PostCode);
            IF NOT PostRec.FINDSET THEN BEGIN
                PostRec.INIT;
                PostRec.Code := PostCode;
                PostRec.City := City;
                PostRec."Search City" := UPPERCASE(City);
                PostRec."Country/Region Code" := Country;
                PostRec.INSERT(FALSE);
            end;
        end;
    end;


    trigger OnRun()
    begin

    end;

    var

}