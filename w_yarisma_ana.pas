unit w_yarisma_ana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SpinEx, Forms, Controls, Graphics, Dialogs,
  DBCtrls, DBGrids, StdCtrls;

type

  { TF_yarisma_ana }

  TF_yarisma_ana = class(TForm)
    btnOrtalamaHesabEt: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    spnJuriAdedi: TSpinEditEx;
    procedure btnOrtalamaHesabEtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  F_yarisma_ana: TF_yarisma_ana;

implementation

{$R *.lfm}

{ TF_yarisma_ana }
Uses w_yarisma_dm1;

procedure TF_yarisma_ana.FormCreate(Sender: TObject);
begin

end;

procedure TF_yarisma_ana.btnOrtalamaHesabEtClick(Sender: TObject);
Var IntA:Integer;
    Sql:String;
begin
  Sql := 'Update Yarismacilar ' + Char(13) +
         ' Set Ortalama =  (0 ';
  For IntA:=1 To spnJuriAdedi.Value Do
    Begin
    Sql := Sql + ' + juri' + inttostr(IntA);
    End;
  Sql := Sql + ') / ' + inttostr(IntA)+ Char(13) +
         'Where RbtYarismalar = ' + DM1.ZQ_YarismalarOKytNo.Value.ToString;

  //Memo1.text := Sql;
  DM1.ZQ_Update.SQL.Clear;
  DM1.ZQ_Update.SQL.Add(Sql);
  DM1.ZQ_Update.ExecSQL;
  DM1.ZQ_Yarismacilar.Close;
  DM1.ZQ_Yarismacilar.Open;

  DM1.ZQ_Siralama.close;
  DM1.SiraNo:= 0;
  DM1.ZQ_Siralama.SQL.Clear;
  DM1.ZQ_Siralama.SQL.Add(
         ' Select OKytNo, isim, Ortalama From Yarismacilar ' + Char(13) +
         ' Where RbtYarismalar = ' + DM1.ZQ_YarismalarOKytNo.Value.ToString + Char(13) +
         ' Order BY Ortalama Desc ');
  DM1.ZQ_Siralama.Open;

end;

procedure TF_yarisma_ana.FormShow(Sender: TObject);
begin
  DM1.ZQ_Yarismalar.Close;
  DM1.ZQ_Yarismalar.Open;
  DM1.ZQ_Yarismacilar.Close;
  DM1.ZQ_Yarismacilar.Open;


end;

end.

