program program_simulasi_stack;
uses crt;

const
  MAX = 5; 
var
  stack: array[1..MAX] of integer;
  top: integer; 
  pilihan, angka: integer;

procedure push(x: integer);
begin
  if top = MAX then
    writeln('Stack penuh!')
  else
  begin
    top := top + 1;       
    stack[top] := x;   
    writeln('====================================');
    writeln(x, ' berhasil dimasukkan ke stack.');
    writeln('====================================');
  end;
end;

procedure pop;
begin
  if top = 0 then
    writeln('Stack kosong!')
  else
  begin
    writeln(stack[top], ' dikeluarkan dari stack.');
    top := top - 1;      
  end;
end;

procedure tampilkan;
var
  i: integer;
begin
  if top = 0 then
    writeln('Stack kosong!')
  else
  begin
    writeln('Isi stack (atas ke bawah):');
    for i := top downto 1 do
      writeln('| ', stack[i], ' |');
  end;
end;

begin
  clrscr;
  top := 0; 

  repeat
    writeln('========= program simulasi stack ========');
    writeln('======== MENU PROGRAM =========');
    writeln('1. Push ');
    writeln('2. Pop ');
    writeln('3. Lihat isi stack');
    writeln('4. Keluar');
    write('Pilih menu: '); readln(pilihan);

    case pilihan of
    1: begin
        write('Masukkan angka: '); readln(angka);
        push(angka);
        end;
    2: begin
        clrscr;
        pop;
        end;
    3: begin
        clrscr;
        tampilkan;
        end;
    end;

    writeln;
  until pilihan = 4;

  writeln('Program selesai.');
  readln;
end.
