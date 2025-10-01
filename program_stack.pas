program program_simulasi_stack;
uses crt;

const
  MAX = 4; 
var
  stack: array[1..MAX] of integer;
  top: integer; 
  pilihan, angka: integer;

procedure push(x: integer);
begin
  if top = MAX then
    writeln('~~ TUMPUKKAN PIRING PENUH!!! ~~')
  else
  begin
    top := top + 1;       
    stack[top] := x;   
    writeln('===========================================');
    writeln(x, ' berhasil dimasukkan ke tumpukan piring.');
    writeln('===========================================');
    writeln( ' ~~ tekan ENTER untuk melanjutkan ~~');
  end;
end;

procedure pop;
begin
  if top = 0 then
    writeln('~~ PIRING KOSONG!!!! ~~')
  else
  begin
    writeln('_________________________________________________________')
    writeln('piring | ', stack[top], ' | telah diambil dari tumpukan.');
    top := top - 1;    
    
  end;
end;

procedure tampilkan;
var
  i: integer;
begin
  if top = 0 then
    writeln('~~ PIRING KOSONG!!!! ~~')
  else
  begin
    writeln('tumpukkan piring (atas ke bawah):');
    for i := top downto 1 do
      writeln('| ', stack[i], ' |');
  end;
end;

begin
  clrscr;
  top := 0; 
  repeat
  clrscr;  
    writeln('=========================================');
    writeln('========= Program Simulasi Stack ========');
    writeln('=========================================');
    writeln('');
    writeln('||||||||||||| MENU PROGRAM ||||||||||||||');
    writeln('1. Push ');
    writeln('2. Pop ');
    writeln('3. Lihat tumpukan piring');
    writeln('4. Keluar');
    write('Pilih menu: '); readln(pilihan);

    case pilihan of
    1: begin
        write('Masukkan angka: '); readln(angka);
        push(angka);
        readln();
        end;
    2: begin
        clrscr;
        pop;
        readln();
        end;
    3: begin
        clrscr;
        tampilkan;
        writeln('~~ Tekan ENTER untuk melanjutkan ~~');
        readln();
        end;
    end;

    writeln;
  until pilihan = 4;

  writeln('=============================');
  writeln('====== Program selesai ======');
  writeln('=============================');
  readln;
end.
