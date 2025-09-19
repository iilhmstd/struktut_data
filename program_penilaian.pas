program DataMahasiswaGabungan;
uses crt;

type
  TMahasiswa = record
    NIM   : string[15];
    Nama  : string[20];
    Tugas : real;
    UTS   : real;
    UAS   : real;
    NA    : real;
    Grade : char;
  end;

  PMhs = ^Node;
  Node = record
    data : TMahasiswa;
    no   : integer;
    next : PMhs;
  end;

var
  Mhs  : array[1..5] of TMahasiswa;   { Array untuk input data }
  head, tail, baru : PMhs;
  n, i : integer;

function HitungGrade(na: real): char;
begin
  if na >= 80 then HitungGrade := 'A'
  else if na >= 70 then HitungGrade := 'B'
  else if na >= 60 then HitungGrade := 'C'
  else if na >= 50 then HitungGrade := 'D'
  else HitungGrade := 'E';
end;

begin
  clrscr;
  write('Masukkan jumlah mahasiswa: '); readln(n);

  { Input data ke array }
  for i := 1 to n do
  begin
    writeln('Mahasiswa ke-', i);
    write('NIM   : '); readln(Mhs[i].NIM);
    write('Nama  : '); readln(Mhs[i].Nama);
    write('Tugas : '); readln(Mhs[i].Tugas);
    write('UTS   : '); readln(Mhs[i].UTS);
    write('UAS   : '); readln(Mhs[i].UAS);

    Mhs[i].NA := (Mhs[i].Tugas + Mhs[i].UTS + Mhs[i].UAS) / 3;
    Mhs[i].Grade := HitungGrade(Mhs[i].NA);

    writeln;
  end;

  { Pindahkan dari array ke linked list }
  head := nil; tail := nil;
  for i := 1 to n do
  begin
    new(baru);
    baru^.data := Mhs[i];
    baru^.no   := i;
    baru^.next := nil;

    if head = nil then
    begin
      head := baru;
      tail := baru;
    end
    else
    begin
      tail^.next := baru;
      tail := baru;
    end;
  end;

  { Tampilkan data lewat linked list }
  clrscr;
  writeln('-------------------------------------------------------------------');
  writeln('NO   NIM           NAMA         TUGAS   UTS   UAS   NA     GRADE');
  writeln('-------------------------------------------------------------------');

  baru := head;
  while baru <> nil do
  begin
    writeln(baru^.no:2, '  ',
            baru^.data.NIM:12, '  ',
            baru^.data.Nama:10, '  ',
            baru^.data.Tugas:6:2, '  ',
            baru^.data.UTS:6:2, '  ',
            baru^.data.UAS:6:2, '  ',
            baru^.data.NA:6:2, '  ',
            baru^.data.Grade:2);
    baru := baru^.next;
  end;

  writeln('-------------------------------------------------------------------');
  readln;
end.
