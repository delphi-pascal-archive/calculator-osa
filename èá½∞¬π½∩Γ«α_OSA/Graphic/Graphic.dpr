library Graphic;

{ Библиотека поддержки отображения математических выражений }

uses
  Classes, ExtCtrls, SysUtils, JPEG, IniFiles, Graphics, ExprDraw, ExprMake;

{$R *.res}

var
  Expr: TExprClass;
  DY: Integer;
  Builder: TExprBuilder;
  MX: Integer;
  f: TIniFile;

procedure Prepare(Image: TImage);
begin
  with Image.Picture.Bitmap do
  begin
    Width := 2000;
    Height := 4000;
    Canvas.Brush.Style := bsSolid;
    Canvas.Brush.Color := clWhite;
    Canvas.FillRect(Rect(0, 0, Width, Height))
  end;
  DY := 5;
  MX := 0;
  Builder := TExprBuilder.Create;
end;

procedure EndComment(Image: TImage);
begin
  Builder.Free;
  Image.Picture.Bitmap.Width := MX + 10;
  Image.Picture.Bitmap.Height := DY;
  Image.Width := MX + 10;
  Image.Height := DY;
end;

procedure Comment(Image: TImage;Expression, Comment: string);
var
  N: boolean;
begin
  f := TIniFile.Create(PAnsiChar(GetCurrentDir()) + '\main.ini');
  Expr := TExprVar.Create(' ');
  Expr.Color := clBlack;
  Expr.AddNext(TExprVar.Create(Comment));
  // Expr.Next.Color:=clBlue;
  if Expression <> ' ' then
  Expr.AddNext(Builder.BuildExpr(Expression));
  Expr := TExprChain.Create(Expr);
  Expr.Canvas := Image.Picture.Bitmap.Canvas;
  //Expr.Font.Size := 11;

  with Expr.Font do
  begin
    Size := f.Readinteger('FontDialog', 'fontSize', Size);
    Name := f.ReadString('FontDialog','font', Name);
    if (f.ReadBool('FontDialog', 'fsBold', N))or(f.ReadBool('FontDialog', 'fsItalic', N))
    then
    begin
      if f.ReadBool('FontDialog', 'fsBold', N) then Style := Style + [fsBold];
      if F.ReadBool('FontDialog', 'fsItalic', N) then Style := Style + [fsItalic];
    end
    else Style := [];
  end;

  Expr.Draw(5, DY, ehLeft, evTop);
  Inc(DY, Expr.Height + 5);
  if MX < Expr.Width then MX := Expr.Width;
  Expr.Free;
end;

procedure SaveToJPG(Image: TImage; FileName: String);
var
  JpegIm: TJpegImage;
begin
  JpegIm := TJpegImage.Create;
  JpegIm.Assign(image.Picture.Bitmap);
  JpegIm.CompressionQuality := 50;
  JpegIm.Compress;
  JpegIm.SaveToFile(FileName);
  JpegIm.Destroy;
end;

exports Prepare, EndComment, Comment, SaveToJPG;

begin
end.
 