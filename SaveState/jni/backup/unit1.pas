{hint: Pascal files location: .../SaveState/jni }
unit unit1;

{$mode delphi}

interface

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, AndroidWidget, Laz_And_Controls, preferences;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    jListView1: jListView;
    jPreferences1: jPreferences;
    procedure AndroidModule1Show(Sender: TObject);
    procedure jListView1ClickItem(Sender: TObject; itemIndex: integer;
      itemCaption: string);
    procedure jListView1ClickWidgetItem(Sender: TObject; itemIndex: integer;
      checked: boolean);
  private
    {private declarations}
  public
    {public declarations}
  end;

var
  AndroidModule1: TAndroidModule1;

implementation
  
{$R *.lfm}
  

{ TAndroidModule1 }

procedure TAndroidModule1.AndroidModule1Show(Sender: TObject);
var
  i: Integer;
  s: String;
begin
  for i:=0 to 50 do begin
      s:='Item '+i.ToString;
      jListView1.Add(s);
      jListView1.SetWidgetCheck(jPreferences1.GetBoolData(s,false),i);
  end;
end;

procedure TAndroidModule1.jListView1ClickItem(Sender: TObject;
  itemIndex: integer; itemCaption: string);
begin
  if jListView1.IsItemChecked(itemIndex) then
    ShowMessage('CHECKED')
  else
    ShowMessage('UNCHECKED');
end;

procedure TAndroidModule1.jListView1ClickWidgetItem(Sender: TObject;
  itemIndex: integer; checked: boolean);
begin
   jPreferences1.SetBoolData(jListView1.Items[itemIndex],checked);
end;

end.
