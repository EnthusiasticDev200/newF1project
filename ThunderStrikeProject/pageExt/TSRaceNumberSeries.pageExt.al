pageextension 50100 "TS Race Number Series" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {
            field(Race;Rec.Race)
            {
                ApplicationArea = All;
                Caption = 'Race';
            }
            field("Race Assignment";Rec."Race Assignment")
            {
                ApplicationArea = All;
                Caption = 'Race Assignemnt';
            }
            field("Race Member";Rec."Race Member")
            {
                ApplicationArea = All;
                Caption = 'Race Member';
            }
        }
    }
}