unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.ActiveX, System.Win.ComObj,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    Function GetMainBoardSerial : string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  edt1.Text := GetMainBoardSerial;
end;

function TForm1.GetMainBoardSerial: string;
var
     objWMIService : OLEVariant;
     colItems : OLEVariant;
     ColItem : OLEVariant;
     oEnum : IEnumVariant;
     IValue : LongWord;
     Function GetWMINobject (const objectName : string) : IDispatch;
     var
            chEaten : Integer;
            BindCtx : IBindCtx;
            Moniker : Imoniker;
            OleStr: PWideChar;
     Begin
        OleCheck(CreateBindCtx(0, BindCtx));
        OleStr := StringtoOLEStr(objectName);
        try
          OleCheck(MkParseDisplayName (BindCtx, OleStr, chEaten, Moniker));          
        finally
          SysFreeString(OleStr);
        end;
        OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result));
     end;
begin
   Result :=  '';
   objWMIservice := GetWMINObject('winmgmts:\\localhost\root\cimv2');
   colItems := objWMIService.EXecQuery('Select SerialNumber From Win32_BaseBoard', 'WQL', 0);
   oEnum := IUnknown(colItems._NewENum) as IEnumVariant;
   if oEnum.Next (1, ColItem, Ivalue) = 0 then
   Result := VarTostr(ColItem.SerialNumber);
end;

end.
