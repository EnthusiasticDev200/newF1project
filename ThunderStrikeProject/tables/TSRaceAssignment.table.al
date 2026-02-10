table 50102 "TS Race Assignment"
{
    Caption = 'Race Assignment';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1;"Assignment No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Race No."; Code[20])
        {
            Caption = 'Race No.';
            TableRelation = "TS Race Event";
            // create a logic to filter race to only display those with recent date.
        }
        field(3; "Race Member"; Code[20])
        {
            Caption = 'Race Member';
            TableRelation = "TS Race Member";
        }
        field(4; "Assignment Status"; Boolean)
        {
            Caption = 'Status';
            Editable = false;
            //make true if race is past.
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
    }
    
    keys
    {
        key(PK; "Assignment No.")
        {
            Clustered = true;
        }
    }

    var
        SalesSetup : Record "Sales & Receivables Setup";
        NoSeriesMgt : Codeunit "No. Series";
    trigger OnInsert()
    begin
        if "Assignment No." = '' then begin
            SalesSetup.Get();
            // test if it works. replace others if it does
            if not NoSeriesMgt.AreRelated(SalesSetup."Race Assignment", xRec."No. Series") then begin
                "No. Series" := SalesSetup."Race Assignment";
                "Assignment No." := NoSeriesMgt.GetNextNo("No. Series", WorkDate())
            end;
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