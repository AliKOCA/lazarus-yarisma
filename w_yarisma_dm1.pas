unit w_yarisma_dm1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LR_DBSet, LR_Class, ZConnection, ZDataset,
  ZSqlUpdate;

type

  { TDM1 }

  TDM1 = class(TDataModule)
    DS_Yarismacilar: TDataSource;
    DS_ZQ_Siralama: TDataSource;
    DS_Yarismalar: TDataSource;
    frDBDSYarismalar: TfrDBDataSet;
    frDBDSYarismacilar: TfrDBDataSet;
    frDBDSSiralama: TfrDBDataSet;
    frReport1: TfrReport;
    frReport2: TfrReport;
    ZConnection1: TZConnection;
    ZQ_Siralamaisim: TStringField;
    ZQ_SiralamaOKytNo: TLargeintField;
    ZQ_SiralamaOrtalama: TFloatField;
    ZQ_SiralamaSiraNo: TLongintField;
    ZQ_Update: TZQuery;
    ZQ_Yarismacilar: TZQuery;
    ZQ_Siralama: TZQuery;
    ZQ_Yarismacilarisim: TStringField;
    ZQ_Yarismacilarjuri1: TFloatField;
    ZQ_Yarismacilarjuri10: TFloatField;
    ZQ_Yarismacilarjuri2: TFloatField;
    ZQ_Yarismacilarjuri3: TFloatField;
    ZQ_Yarismacilarjuri4: TFloatField;
    ZQ_Yarismacilarjuri5: TFloatField;
    ZQ_Yarismacilarjuri6: TFloatField;
    ZQ_Yarismacilarjuri7: TFloatField;
    ZQ_Yarismacilarjuri8: TFloatField;
    ZQ_Yarismacilarjuri9: TFloatField;
    ZQ_YarismacilarOKytNo: TLargeintField;
    ZQ_YarismacilarOrtalama: TFloatField;
    ZQ_YarismacilarRbtYarismalar: TLargeintField;
    ZQ_Yarismalar: TZQuery;
    ZQ_YarismalarOKytNo: TLargeintField;
    ZQ_YarismalarYarismaIsmi: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ZConnection1AfterConnect(Sender: TObject);
    procedure ZQ_SiralamaCalcFields(DataSet: TDataSet);
    procedure ZQ_YarismalarAfterScroll(DataSet: TDataSet);
  private

  public
    SiraNo:Integer;
  end;

var
  DM1: TDM1;


implementation

{$R *.lfm}

{ TDM1 }

procedure TDM1.DataModuleCreate(Sender: TObject);
begin

end;

procedure TDM1.ZConnection1AfterConnect(Sender: TObject);
begin

end;

procedure TDM1.ZQ_SiralamaCalcFields(DataSet: TDataSet);
begin
  SiraNo := SiraNo + 1;
  DM1.ZQ_SiralamaSiraNo.AsInteger:= SiraNo;
end;

procedure TDM1.ZQ_YarismalarAfterScroll(DataSet: TDataSet);
begin
  ZQ_Siralama.close;
end;

end.

