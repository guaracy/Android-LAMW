{hint: Pascal files location: .../LAMWCalculator/jni }
unit unit1;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, linearlayout, Laz_And_Controls, expression;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    jButton1: jButton;
    jButton10: jButton;
    jButton11: jButton;
    jButton12: jButton;
    jButton13: jButton;
    jButton14: jButton;
    jButton15: jButton;
    jButton16: jButton;
    jButton17: jButton;
    jButton18: jButton;
    jButton19: jButton;
    jButton2: jButton;
    jButton20: jButton;
    jButton3: jButton;
    jButton4: jButton;
    jButton5: jButton;
    jButton6: jButton;
    jButton7: jButton;
    jButton8: jButton;
    jButton9: jButton;
    jExpression1: jExpression;
    jLinearLayout1: jLinearLayout;
    jLinearLayout2: jLinearLayout;
    jLinearLayout3: jLinearLayout;
    jLinearLayout4: jLinearLayout;
    jLinearLayout5: jLinearLayout;
    jLinearLayout6: jLinearLayout;
    jLinearLayout7: jLinearLayout;
    txtDisplay: jTextView;
    procedure jButton1Click(Sender: TObject);
  private
    function Evaluate: string;
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule1: TAndroidModule1;
  Dirty : Boolean = False;
implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

function TAndroidModule1.Evaluate:string;
begin
  Dirty:=True;
  jExpression1.SetFormula(txtDisplay.Text,[]);
  Result:='Erro';
  if jExpression1.IsExpressionValid(False)) then
    if jExpression1.CanEvaluate(False) then
      Result:=FloatToStr(jExpression1.GetValue)
end;

procedure TAndroidModule1.jButton1Click(Sender: TObject);
var
  op: Char;
  dsp: String;
begin
  op := (Sender as jButton).Text[1];
  if Dirty then begin
    dsp:='';
    Dirty:=False;
  end else
    dsp:=txtDisplay.Text;
  case op of
  'C' : dsp:='';
  'B' : dsp:=LeftStr(dsp,Length(dsp)-1);
  '=' : dsp:=Evaluate;
  else
    if (op='*') and (dsp.EndsWith('*')) then
      dsp[Length(dsp)]:='^'
    else
      dsp+=op;
  end;
  txtDisplay.Text:=dsp;
end;

end.
