table 50100 "TS Race Event"
{
    DataClassification = CustomerContent;
    Caption = 'Race Event';
    
    fields
    {
        field(1;"Race No."; Code[20])
        {
            Caption = 'Race No.';
            Editable = false;            
        }
        field(2;Name; Text[20])
        {
            Caption = 'Name';            
        }
        field(3;Date; Date)
        {
            Caption = 'Scheduled Date';            
        }
        field(4; Circuit; Text[50])
        {
            Caption = 'Circuit';            
        }
        field(5;Location; Code[20])
        {
            Caption = 'Location';            
        }
        field(6; Status; Enum "TS Race Status")
        {
            Caption = 'Status';
            Editable = false;
        }
        field(7; "Is Past Scheduled"; Boolean)
        {
            Caption = 'IsPast';
            Editable = false;
            // make not visible
        }
        field(8; "Past Scheduled At"; DateTime)
        {
            Caption = 'Past Scheduled At';
            Editable = false;
            // make not visible
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = ' No. Series';
            TableRelation = "No. Series";
        }
    }
    
    keys
    {
        key(PK; "Race No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        SalesSetup : Record "Sales & Receivables Setup";
        NoSeriesMgt : Codeunit "No. Series";
    
    trigger OnInsert()
    begin
        if "Race No." = '' then begin
            SalesSetup.Get();
            if NoSeriesMgt.AreRelated(SalesSetUp.Race, xRec."No. Series") then
                "No. Series" := xRec."No. Series"
            else
            "No. Series" := SalesSetUp.Race;
            "Race No." := NoSeriesMgt.GetNextNo("No. Series", WorkDate());
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