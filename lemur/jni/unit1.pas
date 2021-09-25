{hint: Pascal files location: .../lemur/jni }
unit unit1;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, drawingview, Laz_And_Controls, linearlayout,
  And_jni;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    jBitmap1: jBitmap;
    jButton1: jButton;
    jDrawingView1: jDrawingView;
    jLinearLayout1: jLinearLayout;
    jTimer1: jTimer;
    procedure AndroidModule1JNIPrompt(Sender: TObject);
    procedure jButton1Click(Sender: TObject);
    procedure jDrawingView1Draw(Sender: TObject; countXY: integer;
      X: array of single; Y: array of single; flingGesture: TFlingGesture;
      pinchZoomScaleState: TPinchZoomScaleState; zoomScale: single);
    procedure jTimer1Timer(Sender: TObject);
  private
    sf,
    px,
    sx,
    sy : integer;
  public
    {public declarations}
  end;

var
  AndroidModule1: TAndroidModule1;

implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

procedure TAndroidModule1.AndroidModule1JNIPrompt(Sender: TObject);
begin
  jBitmap1.LoadFromAssets('lemur_walk.png');
  sx := 282;
  sy := 286;
  sf := 2;
  jDrawingView1.Width:=sx*sf;
  jDrawingView1.Height:=sy*sf;
end;

procedure TAndroidModule1.jButton1Click(Sender: TObject);
begin
  if jButton1.Tag=0 then begin
    jButton1.Tag:=1;
    jButton1.Text:='Stop';
  end else begin
    jButton1.Tag:=0;
    jButton1.Text:='Start';
  end;
  jTimer1.Enabled:=not jTimer1.Enabled;
end;

procedure TAndroidModule1.jDrawingView1Draw(Sender: TObject; countXY: integer;
  X: array of single; Y: array of single; flingGesture: TFlingGesture;
  pinchZoomScaleState: TPinchZoomScaleState; zoomScale: single);
begin
  jDrawingView1.DrawBitmap(jBitmap1.GetImage(),px,0,px+sx,sy,0,0,sx*sf,sy*sf);
end;

procedure TAndroidModule1.jTimer1Timer(Sender: TObject);
begin
  jDrawingView1.Refresh;
  px += sx;
  if px >= 4794 then
    px:=0;
end;

end.
