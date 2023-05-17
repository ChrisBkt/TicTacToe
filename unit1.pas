unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TTicTacToe }

  TTicTacToe = class(TForm)
    Reset: TButton;
    WinnerText: TLabel;
    Field11: TLabel;
    Field12: TLabel;
    Field13: TLabel;
    Field21: TLabel;
    Field22: TLabel;
    Field23: TLabel;
    Field31: TLabel;
    Field32: TLabel;
    Field33: TLabel;
    procedure Field11Click(Sender: TObject);
    procedure Field12Click(Sender: TObject);
    procedure Field13Click(Sender: TObject);
    procedure Field21Click(Sender: TObject);
    procedure Field22Click(Sender: TObject);
    procedure Field23Click(Sender: TObject);
    procedure Field31Click(Sender: TObject);
    procedure Field32Click(Sender: TObject);
    procedure Field33Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AfterRun;
    procedure ResetClick(Sender: TObject);
    procedure ResetColors;
    procedure SmartPick;
    function CheckHorizontal(start: Integer): Integer;
    function CheckVertical(start: Integer): Integer;
    function CheckDiagonal: Integer;
    function AllFieldsSet: Boolean;
    function GetHorizontal: Integer;
    function GetVertical: Integer;
    function CheckForWinner: Boolean;
  private

  public

  end;

var
  TicTacToe: TTicTacToe;
  labelArray: array[0..8] of TLabel;
  Winner: Integer = 0;

implementation

{$R *.lfm}

{ TTicTacToe }

procedure TTicTacToe.Field11Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field11.Caption = '-' then
    begin
        Field11.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field12Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field12.Caption = '-' then
    begin
        Field12.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field13Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field13.Caption = '-' then
    begin
        Field13.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field21Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field21.Caption = '-' then
    begin
        Field21.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field22Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field22.Caption = '-' then
    begin
        Field22.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field23Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field23.Caption = '-' then
    begin
        Field23.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field31Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field31.Caption = '-' then
    begin
        Field31.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field32Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field32.Caption = '-' then
    begin
        Field32.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.Field33Click(Sender: TObject);
begin
    if Winner <> 0 then
    begin
        Exit;
    end;
    if Field33.Caption = '-' then
    begin
        Field33.Caption:='X';
        AfterRun;
    end;
end;

procedure TTicTacToe.FormCreate(Sender: TObject);
begin
    labelArray[0] := Field11;
    labelArray[1] := Field12;
    labelArray[2] := Field13;
    labelArray[3] := Field21;
    labelArray[4] := Field22;
    labelArray[5] := Field23;
    labelArray[6] := Field31;
    labelArray[7] := Field32;
    labelArray[8] := Field33;
    if Random(100) < 50 then
    begin
        SmartPick;
    end;
end;

procedure TTicTacToe.AfterRun;
begin
    CheckForWinner;
    if Winner = 0 then
    begin
        if AllFieldsSet then
        begin
            WinnerText.Caption := 'Das Spiel ist unentschieden';
            Exit;
        end;
        SmartPick;
        if CheckForWinner then
        begin
            if Winner = 1 then
            begin
                WinnerText.Caption:='Du hast gewonnen!';
            end
            else
            begin
                WinnerText.Caption:='Du hast verloren! :(';
            end;
        end
        else
        begin
            if AllFieldsSet then
            begin
                WinnerText.Caption := 'Das Spiel ist unentschieden';
                Exit;
            end;
        end;
    end
    else
    begin
      if Winner = 1 then
      begin
          WinnerText.Caption:='Du hast gewonnen!';
      end
      else
      begin
          WinnerText.Caption:='Du hast verloren! :(';
      end;
    end;
end;

procedure TTicTacToe.ResetClick(Sender: TObject);
var
  i: Integer = 0;
begin
    for i := 0 to 8 do
    begin
        labelArray[i].Color := clNone;
        labelArray[i].Caption := '-';
    end;
    WinnerText.Caption := '';
    Winner := 0;
    if Random(100) < 50 then
    begin
        SmartPick;
    end;
end;

procedure TTicTacToe.ResetColors;
var
  i: Integer = 0;
begin
    for i := 0 to 8 do
    begin
        labelArray[i].Color := clNone;
    end;
end;

procedure TTicTacToe.SmartPick;
var
  emptyIndices: array of Integer;
  numEmptyFields, randomIndex, i: Integer;
begin
  if Winner <> 0 then
  begin
    Exit;
  end;

  SetLength(emptyIndices, 0);
  for i := 0 to 8 do
  begin
    if labelArray[i].Caption = '-' then
    begin
      SetLength(emptyIndices, Length(emptyIndices) + 1);
      emptyIndices[High(emptyIndices)] := i;
    end;
  end;

  numEmptyFields := Length(emptyIndices);

  if numEmptyFields > 0 then
  begin
    // Entscheidung mit Wahrscheinlichkeit 50/50
    if Random(100) < 50 then
    begin
      randomIndex := emptyIndices[Random(numEmptyFields)];
      labelArray[randomIndex].Caption := 'O';
      Exit;
    end;

    for i := 0 to numEmptyFields - 1 do
    begin
      labelArray[emptyIndices[i]].Caption := 'O';
      if CheckForWinner then
      begin
        labelArray[emptyIndices[i]].Caption := 'O';
        Exit;
      end;
      labelArray[emptyIndices[i]].Caption := '-';
    end;

    for i := 0 to numEmptyFields - 1 do
    begin
      labelArray[emptyIndices[i]].Caption := 'X';
      if CheckForWinner then
      begin
        ResetColors;
        labelArray[emptyIndices[i]].Caption := 'O';
        Exit;
      end;
      labelArray[emptyIndices[i]].Caption := '-';
    end;

    randomIndex := emptyIndices[Random(numEmptyFields)];
    labelArray[randomIndex].Caption := 'O';
  end;
end;

function TTicTacToe.AllFieldsSet: Boolean;
var
  i: Integer = 0;
begin
  for i := 0 to 8 do
  begin
    if labelArray[i].Caption = '-' then
    begin
      result := false;
      Exit;
    end;
  end;
  result := true;
end;

function TTicTacToe.GetHorizontal: Integer;
var
  Horizontal: Integer = 0;
begin
    Horizontal := CheckHorizontal(0);
    if Horizontal = 0 then
    begin
        Horizontal := CheckHorizontal(3);
        if Horizontal = 0 then
        begin
            Horizontal := CheckHorizontal(6);
        end;
    end;
    result := Horizontal;
end;

function TTicTacToe.GetVertical: Integer;
var
  Vertical: Integer = 0;
begin
    Vertical := CheckVertical(0);
    if Vertical = 0 then
    begin
        Vertical := CheckVertical(1);
        if Vertical = 0 then
        begin
            Vertical := CheckVertical(2);
        end;
    end;
    result := Vertical;
end;

function TTicTacToe.CheckHorizontal(start: Integer): Integer;
begin
    if labelArray[start].Caption <> '-' then
    begin
        if (labelArray[start].Caption = labelArray[start + 1].Caption) and (labelArray[start + 1].Caption = labelArray[start + 2].Caption) then
        begin
            if labelArray[start].Caption = 'X' then
            begin
                labelArray[start].Color := clGreen;
                labelArray[start + 1].Color := clGreen;
                labelArray[start + 2].Color := clGreen;
                result := 1;
            end
            else
            begin
                 labelArray[start].Color := clRed;
                 labelArray[start + 1].Color := clRed;
                 labelArray[start + 2].Color := clRed;
                result := 2;
            end
        end
        else
           result := 0
    end
    else
        result := 0
end;

function TTicTacToe.CheckVertical(start: Integer): Integer;
begin
    if labelArray[start].Caption <> '-' then
    begin
        if (labelArray[start].Caption = labelArray[start + 3].Caption) and (labelArray[start + 3].Caption = labelArray[start + 6].Caption) then
        begin
            if labelArray[start].Caption = 'X' then
            begin
                labelArray[start].Color := clGreen;
                labelArray[start + 3].Color := clGreen;
                labelArray[start + 6].Color := clGreen;
                result := 1;
            end
            else
            begin
                 labelArray[start].Color := clRed;
                 labelArray[start + 3].Color := clRed;
                 labelArray[start + 6].Color := clRed;
                result := 2;
            end
        end
        else
           result := 0
    end
    else
        result := 0
end;

function TTicTacToe.CheckDiagonal: Integer;
begin
    if labelArray[4].Caption <> '-' then
    begin
        if (labelArray[0].Caption = labelArray[4].Caption) and (labelArray[4].Caption = labelArray[8].Caption) then
        begin
            if labelArray[0].Caption = 'X' then
            begin
                labelArray[0].Color := clGreen;
                labelArray[4].Color := clGreen;
                labelArray[8].Color := clGreen;
                result := 1;
            end
            else
            begin
                 labelArray[0].Color := clRed;
                 labelArray[4].Color := clRed;
                 labelArray[8].Color := clRed;
                 result := 2;
            end
        end
        else
        begin
          if (labelArray[2].Caption = labelArray[4].Caption) and (labelArray[4].Caption = labelArray[6].Caption) then
          begin
            if labelArray[2].Caption = 'X' then
            begin
                 labelArray[2].Color := clGreen;
                 labelArray[4].Color := clGreen;
                 labelArray[6].Color := clGreen;
                 result := 1;
            end
            else
            begin
                 labelArray[2].Color := clRed;
                 labelArray[4].Color := clRed;
                 labelArray[6].Color := clRed;
                 result := 2;
            end
          end
          else
              result := 0
        end
    end
    else
        result := 0
end;

function TTicTacToe.CheckForWinner: Boolean;
var
  Horizontal: Integer = 0;
  Vertical: Integer = 0;
  Diagonal: Integer = 0;
begin
    Horizontal := GetHorizontal;
    if Horizontal = 0 then
    begin
        Vertical := GetVertical;
        if Vertical = 0 then
        begin
            Diagonal := CheckDiagonal;
            Winner := Diagonal
        end
        else
            Winner := Vertical
    end
    else
    begin
        Winner := Horizontal
    end;
    if Winner = 0 then
    begin
       result := false;
    end
    else
        result := true
end;

end.

