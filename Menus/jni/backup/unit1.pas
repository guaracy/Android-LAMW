{hint: Pascal files location: .../GBMMenu/jni }
unit unit1;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, menu, And_jni, Laz_And_Controls,unit2,unit3;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    jMenu1: jMenu;
    jPanel1: jPanel;
    jPanel2: jPanel;
    jTextView1: jTextView;
    procedure AndroidModule1ActivityCreate(Sender: TObject; intentData: jObject
      );
    procedure AndroidModule1ClickOptionMenuItem(Sender: TObject;
      jObjMenuItem: jObject; itemID: integer; itemCaption: string;
      checked: boolean);
    procedure AndroidModule1CreateOptionMenu(Sender: TObject; jObjMenu: jObject
      );
    procedure AndroidModule1JNIPrompt(Sender: TObject);
    procedure AndroidModule1Show(Sender: TObject);
  private
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule1: TAndroidModule1;
  modNum:integer=0;
  Flag:Boolean=false;

implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

procedure TAndroidModule1.AndroidModule1CreateOptionMenu(Sender: TObject;
  jObjMenu: jObject);
var
  i: Integer;
begin
  jMenu1.AddItem(jObjMenu, 101, 'Home', 'ic_home' , mitDefault,   misIfRoom);
  jMenu1.AddItem(jObjMenu, 102, 'Sobre', 'ic_info' , mitDefault,   misIfRoom);
  for i:=0 to jMenu1.Options.Count-1 do begin
    jMenu1.AddItem(jObjMenu, i+10, jMenu1.Options[i], jMenu1.IconIdentifiers[i] , mitDefault,   misNever);
  end;
end;


procedure TAndroidModule1.AndroidModule1JNIPrompt(Sender: TObject);
begin
end;

procedure TAndroidModule1.AndroidModule1Show(Sender: TObject);
begin
end;

procedure TAndroidModule1.AndroidModule1ClickOptionMenuItem(Sender: TObject;
  jObjMenuItem: jObject; itemID: integer; itemCaption: string; checked: boolean
  );
begin
  if itemID=101 then begin
    Self.SetTitleActionBar('Home');
    Self.jPanel2.BringToFront();
    exit;
  end;
  if itemID=102 then begin
    if not AndroidModule3.Initialized then begin
      AndroidModule3.Init(gApp);
      AndroidModule3.jPanel1.Parent:= Self.jPanel1;
      AndroidModule3.jPanel1.SetViewParent(Self.jPanel1.View);
    end;
    SetTitleActionBar('Sobre');
    AndroidModule3.jPanel1.BringToFront();
    exit;
  end;
  ShowMessage('Abrindo página de '+itemCaption+'. Aguarde!');
  if not AndroidModule2.Initialized then begin
    AndroidModule2.Init(gApp);
    AndroidModule2.jPanel1.Parent:= Self.jPanel1;
    AndroidModule2.jPanel1.SetViewParent(Self.jPanel1.View);
  end;
  SetTitleActionBar('Navegador');
  AndroidModule2.jPanel1.BringToFront();  //scene 2

  //jWebView1.GoBack();
  case itemID of
    10 : AndroidModule2.jWebView1.Navigate('https://www.lazarus-ide.org/');
    11 : AndroidModule2.jWebView1.Navigate('https://www.red-lang.org/');
    12 : AndroidModule2.jWebView1.Navigate('https://beadslang.org/');
    13 : AndroidModule2.jWebView1.Navigate('https://elm-lang.org/');
    14 : AndroidModule2.jWebView1.Navigate('https://www2.cs.arizona.edu/icon/');
    15 : AndroidModule2.jWebView1.Navigate('https://nim-lang.org/');
    16 : AndroidModule2.jWebView1.Navigate('https://www.jsoftware.com/');
  end;
end;

procedure TAndroidModule1.AndroidModule1ActivityCreate(Sender: TObject;
  intentData: jObject);
begin
  if AndroidModule2 = nil then
    gApp.CreateForm(TAndroidModule2, AndroidModule2);
  if AndroidModule3 = nil then
    gApp.CreateForm(TAndroidModule3, AndroidModule3);
  SetTitleActionBar('Home');
end;

end.
