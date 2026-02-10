tableextension 50100 "TS Race Number Series" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; Race; Code[20])
        {
            Caption = 'Race';
            TableRelation = "No. Series";
        }
        field(50101; "Race Assignment"; Code[20])
        {
            Caption = 'Race Assignment';
            TableRelation = "No. Series";
        }
        field(50102; "Race Member"; Code[20])
        {
            Caption = 'Race Member';
            TableRelation = "No. Series";
        }
    }
}