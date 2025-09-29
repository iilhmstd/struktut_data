program QueueSederhana;
uses crt;

const
  MAX = 7;   
var
  queue: array[1..MAX] of integer; 
  front, rear: integer; 
  pilihan, angka: integer;


procedure enqueue(x: integer);
begin
  if rear = MAX then
    writeln('Queue penuh!')
  else
  begin
    if front = 0 then front := 1; 
    rear := rear + 1;            
    queue[rear] := x;         
    writeln(x, ' berhasil dimasukkan ke queue.');
  end;
end;


procedure dequeue;
begin
  if (front = 0) or (front > rear) then
  begin
    writeln('Queue kosong!');
    front := 0; rear := 0;  
  end
  else
  begin
    writeln(queue[front], ' dikeluarkan dari queue.');
    front := front + 1;    
  end;
end;


procedure tampilkan;
var
  i: integer;
begin
  if (front = 0) or (front > rear) then
    writeln('Queue kosong!')
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
    writeln('=== MENU QUEUE ===');
    writeln('1. Enqueue (Masukkan data)');
    writeln('2. Dequeue (Keluarkan data)');
    writeln('3. Lihat isi queue');
    writeln('4. Keluar');
    write('Pilih menu: '); readln(pilihan);

    case pilihan of
      1: begin
           write('Masukkan angka: '); readln(angka);
           enqueue(angka);
         end;
      2: dequeue;
      3: tampilkan;
    end;

    writeln;
  until pilihan = 4;

  writeln('Program selesai.');
  readln;
end.
