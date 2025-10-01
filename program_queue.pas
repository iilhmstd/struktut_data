program Program_simulasi_queue;
uses crt;

const
  MAX = 5;   
var
  queue: array[1..MAX] of integer; 
  front, rear: integer; 
  pilihan, angka: integer;

procedure enqueue(x: integer);
begin
  if rear = MAX then
    writeln('~~ ANTRIAN PENUH!!! ~~')
  else
  begin
    if front = 0 then front := 1; 
    rear := rear + 1;            
    queue[rear] := x;       
    clrscr;  
    writeln('===========================================');
    writeln(x, ' berhasil tambahkan ke dalam antrian .');
    writeln('===========================================');
    writeln(x, ' ~~ tekan ENTER untuk melanjutkan ~~');
  end;
end;

procedure dequeue;
begin
  if (front = 0) or (front > rear) then
  begin
    writeln('~~ ANTRIAN KOSONG!!!! ~~');
    front := 0; rear := 0;  
  end
  else
  begin
    writeln('');
    writeln('memanggil antrian ke- 'queue[front]);
    front := front + 1;    
  end;
end;

procedure tampilkan;
var
  i: integer;
begin
  if (front = 0) or (front > rear) then
   writeln('~~ ANTRIAN KOSONG!!!! ~~');
  else
  begin
    writeln('Isi queue (depan ke belakang):');
    for i := front to rear do
      write(queue[i], ' ');
    writeln;
  end;
end;

begin
  clrscr;
  front := 0; rear := 0;

  repeat
    writeln('=========================================');
    writeln('========= Program Simulasi Queue ========');
    writeln('=========================================');
    writeln('');
    writeln('||||||||||||| MENU PROGRAM ||||||||||||||');
    writeln('1. Enqueue');
    writeln('2. Dequeue ');
    writeln('3. Lihat isi antrian');
    writeln('4. Keluar');
    write('Pilih menu: '); readln(pilihan);

    case pilihan of
      1: begin
           write('Masukkan angka: '); readln(angka);
           enqueue(angka);
           readln();
         end;
      2: begin
          clrscr;
          dequeue;
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
