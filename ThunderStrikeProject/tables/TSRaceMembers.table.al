table 50101 "TS Race Member"
{
    Caption = 'Race Member';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Member No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Phone No. "; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Role; Enum "TS Member Role")
        {
            Caption = 'Role';
        }
        field(5; "No.Series"; Code[20])
        {
            Caption = 'No Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Member No.")
        {
            Clustered = true;
        }
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";

    trigger OnInsert()
    begin
        if "Member No." = '' then begin
            SalesSetup.Get();
            if NoSeriesMgt.AreRelated(SalesSetup."Race Member", xRec."No.Series") then
                "No.Series" := xRec."No.Series"
            else
                "No.Series" := SalesSetup."Race Member";
                "Member No." := NoSeriesMgt.GetNextNo("No.Series", WorkDate())
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}