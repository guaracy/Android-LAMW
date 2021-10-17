{hint: Pascal files location: ...//jni }
unit unit2;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, And_jni, linearlayout;
  
type

  { TAndroidModule2 }

  TAndroidModule2 = class(jForm)
    jButton1: jButton;
    jLinearLayout1: jLinearLayout;
    jPanel1: jPanel;
    jTextView1: jTextView;
    jWebView1: jWebView;
    procedure AndroidModule2ActivityCreate(Sender: TObject; intentData: jObject
      );
    procedure jButton1Click(Sender: TObject);
    procedure jWebView1Status(Sender: TObject; Status: TWebViewStatus;
      URL: String; var CanNavi: Boolean);
  private
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule2: TAndroidModule2;

implementation
  
{$R *.lfm}
  

{ TAndroidModule2 }

procedure TAndroidModule2.AndroidModule2ActivityCreate(Sender: TObject;
  intentData: jObject);
begin

end;

procedure TAndroidModule2.jButton1Click(Sender: TObject);
begin
  jWebView1.GoBack();
end;

procedure TAndroidModule2.jWebView1Status(Sender: TObject;
  Status: TWebViewStatus; URL: String; var CanNavi: Boolean);
begin
  jTextView1.Text:=URL;
end;

end.
