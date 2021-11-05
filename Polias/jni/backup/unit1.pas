{hint: Pascal files location: .../Polias/jni }
unit unit1;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, linearlayout, Laz_And_Controls, drawingview;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    btCalcular: jButton;
    edDC: jEditText;
    edN1: jEditText;
    edN2: jEditText;
    edD1: jEditText;
    edD2: jEditText;
    jDrawingView1: jDrawingView;
    jLinearLayout1: jLinearLayout;
    jLinearLayout2: jLinearLayout;
    jLinearLayout3: jLinearLayout;
    jLinearLayout4: jLinearLayout;
    jTextView1: jTextView;
    jTextView2: jTextView;
    jTextView3: jTextView;
    jTextView4: jTextView;
    procedure AndroidModule1JNIPrompt(Sender: TObject);
    procedure AndroidModule1Show(Sender: TObject);
    procedure btCalcularClick(Sender: TObject);
    procedure edN1ActionIconTouchUp(Sender: TObject; textContent: string);
    procedure edN1Enter(Sender: TObject);
    procedure jDrawingView1Draw(Sender: TObject; countXY: integer;
      X: array of single; Y: array of single; flingGesture: TFlingGesture;
      pinchZoomScaleState: TPinchZoomScaleState; zoomScale: single);
  private
    err,
    dc,
    n1, n2,
    d1, d2:integer;
    an,
    lc:single;
    function Calcula:boolean;
  public
    {public declarations}
  end;

const
  ERR_RPM  = 1;
  ERR_DIAM = 2;
  ERR_DIST = 3;

var
  AndroidModule1: TAndroidModule1;
  edc : jEditText;
  etg : integer;

  RMENOR : integer = 50;
  RMAIOR : integer = 100;
  CENTER : integer = 300; //RMAIOR * 3;

implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

procedure TAndroidModule1.AndroidModule1JNIPrompt(Sender: TObject);
begin
  edn1.ShowActionIcon();
  edn2.ShowActionIcon();
  edd1.ShowActionIcon();
  edd2.ShowActionIcon();
  edc:=edd2;
  etg:=4;
  if GetScreenWidth() < 1080 then
    CENTER :=RMAIOR * 2;
  SetTitleActionBar('Cálculo de Polias e Correias');
end;

procedure TAndroidModule1.AndroidModule1Show(Sender: TObject);
begin
end;

procedure TAndroidModule1.btCalcularClick(Sender: TObject);
var
  s: String;
begin
  if not Calcula then begin
     s:=' não pode ser zero!';
    if err=ERR_DIST then
      s:=Format('Distância entre centros deve ser maior que %d!',[d1+d2])
    else if err=ERR_RPM then
        s:='RPM'+s
      else
        s:='Diametro'+s;
    ShowMessage(s);
  end;
end;

procedure TAndroidModule1.edN1ActionIconTouchUp(Sender: TObject;
  textContent: string);
var
  ed : jEditText;
begin
  ed:=(sender as jEditText);
  if ed.ActionIconIdentifier='ic_help' then
    exit;
  ed.HideActionIcon();
  ed.ActionIconIdentifier:='ic_help';
  ed.ShowActionIcon();
  ed.Text:='';
  ed.FontColor:=colbrRed;
  etg:=ed.Tag;
  edc.HideActionIcon();
  edc.ActionIconIdentifier:='ic_check';
  edc.ShowActionIcon();
  edc.FontColor:=colbrLime;
  edc:=ed;
end;
// Correia = (d1 * Pi / 2) + (d2 * pi / 2) + ( 2 * dist) + ((d1 - d2)^2 / (4 * Dist))
function TAndroidModule1.Calcula:boolean;
begin
  Result:=False;
  edc.Text:='';
  err:=ERR_RPM;
  n1:=StrToIntDef(edN1.Text,0); if (n1=0) and (etg<>edN1.Tag) then begin edN1.SetFocus; exit; end;
  n2:=StrToIntDef(edN2.Text,0); if (n2=0) and (etg<>edN2.Tag) then begin edN2.SetFocus; exit; end;
  err:=ERR_DIAM;
  d1:=StrToIntDef(edD1.Text,0); if (d1=0) and (etg<>edD1.Tag) then begin edD1.SetFocus; exit; end;
  d2:=StrToIntDef(edD2.Text,0); if (d2=0) and (etg<>edD2.Tag) then begin edD2.SetFocus; exit; end;
  err:=ERR_DIST;
  case etg of
  1 : begin
        n1:=trunc(n2 / d1 * d2);
        edN1.Text:=n1.ToString;
      end;
  2 : begin
        n2:=trunc(n1 / d2 * d1);
        edN2.Text:=n2.ToString;
      end;
  3 : begin
        d1 :=trunc(n2 / n1 * d2);
        edD1.Text:=d1.ToString;
      end;
  4 : begin
        d2:=trunc(n1 / n2 * d1);
        edD2.Text:=d2.ToString;
      end;
  end;
  dc:=StrToIntDef(edDC.Text,0);
  if dc < (d1 + d2) then
    exit;
  lc := (d1 * Pi / 2) +
        (d2 * pi / 2) +
        ( 2 * dc) + ((d1 - d2)*(d1 - d2) / (4 * dc));
  Result:=True;
  jDrawingView1.Refresh;
end;

procedure TAndroidModule1.edN1Enter(Sender: TObject);
begin
  btCalcularClick(Self);
end;

procedure TAndroidModule1.jDrawingView1Draw(Sender: TObject; countXY: integer;
  X: array of single; Y: array of single; flingGesture: TFlingGesture;
  pinchZoomScaleState: TPinchZoomScaleState; zoomScale: single);
var
  r1, r2,
  px, py, px1, pxc: Integer;
  s: String;

  procedure cota(x,y,r,v,n:integer);
  var
    s: String;
  begin
    jDrawingView1.PaintColor:=colbrWhite;
    jDrawingView1.PaintStrokeWidth:=2;
    jDrawingView1.DrawLine(x-r,y,x+r,y);
    jDrawingView1.DrawLine(x-r,y-10,x-r,y+10);
    jDrawingView1.DrawLine(x+r,y-10,x+r,y+10);
    jDrawingView1.PaintStrokeWidth:=2;
    s:=v.ToString+' mm';
    y:=y+trunc(jDrawingView1.GetTextHeight(s))+20;
    jDrawingView1.DrawText(s,x-jDrawingView1.GetTextWidth(s) / 2 ,y);
    s:=n.ToString+' RPM';
    jDrawingView1.PaintColor:=colbrYellow;
    y:=y+trunc(jDrawingView1.GetTextHeight(s))+20;
    jDrawingView1.DrawText(s,x-jDrawingView1.GetTextWidth(s) / 2 ,y);
  end;

begin
  if (d1>999) or (d2>999) then begin
    ShowMessage('Polia com mais de 1 metro? Procure um engenheiro!');
    edc.Text:='';
    exit;
  end;
  if (n1>9999) or (n2>9999) then begin
    ShowMessage('Rotação acima de 9999 RPMs? Procure um engenheiro!');
    edc.Text:='';
    exit;
  end;
  if d1=0 then exit;
  r1 := RMAIOR;
  r2 := RMAIOR;
  if d1 < d2 then begin
    r1 := Round(r1 * (d1 / d2));
  end else if d1 > d2 then begin
    r2 := Round(r2 * (d2 / d1));
  end;
  px:=CENTER;
  py:=CENTER;
  px1:=jDrawingView1.Width-CENTER;
  // correia
  jDrawingView1.PaintStrokeWidth:=4;
  jDrawingView1.PaintColor:=colbrRed;
  jDrawingView1.DrawLine(px,py - r1,px1,py - r2);
  jDrawingView1.DrawLine(px,py + r1,px1,py + r2);
  // polias
  jDrawingView1.PaintColor:=colbrSilver;
  jDrawingView1.DrawCircle(px,py,r1);
  jDrawingView1.DrawCircle(px1,py,r2);
  // cotas
  cota(px,py+RMAIOR+RMENOR,r1,d1,n1);
  cota(px1,py+RMAIOR+RMENOR,r2,d2,n2);
  // comprimento da polia
  jDrawingView1.PaintColor:=colbrRed;
  s:=format('comp = %.1f mm',[lc]);
  an:=-ArcTan((r2-r1)/(px1-px))*180/pi;
  pxc:=px+(px1-px) div 2;
  jDrawingView1.DrawText(s,pxc-jDrawingView1.GetTextWidth(s) / 2 ,py-RMAIOR-10,an);
  // distância entre centros
  jDrawingView1.PaintStrokeWidth:=4;
  jDrawingView1.PaintColor:=colbrDodgerBlue;
  jDrawingView1.DrawLine(px,py,px1,py);
  jDrawingView1.DrawLine(px,py-10,px,py+10);
  jDrawingView1.DrawLine(px1,py-10,px1,py+10);
  s:=edDC.Text + ' mm';
  jDrawingView1.DrawText(s,pxc-jDrawingView1.GetTextWidth(s) / 2 ,py-10);

end;

end.
