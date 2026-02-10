table 50100 "TS Race Event"
{
    DataClassification = CustomerContent;
    Caption = 'Race Event';
    
    fields
    {
        field(1;"Race No."; Code[20])
        {
            Caption = 'Race No.';            
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
            Caption = ' Status';
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
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
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