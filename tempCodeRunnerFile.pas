program QueueSederhana;
uses crt;

const
  MAX = 5;   // kapasitas maksimal queue
var
  queue: array[1..MAX] of integer; // array untuk menyimpan data
  front, rear: integer; // penunjuk depan dan belakang queue
  pilihan, angka: integer;

// Prosedur ENQUEUE (masukkan data)
procedure enqueue(x: integer);
begin
  if rear = MAX then
    writeln('Queue penuh!')
  else
  begin
    if front = 0 then front := 1; // kalau queue kosong, front dipasang ke 1
    rear := rear + 1;             // geser rear ke belakang
    queue[rear] := x;             // masukkan data ke posisi rear
    writeln(x, ' berhasil dimasukkan ke queue.');
  end;
end;

// Prosedur DEQUEUE (keluarkan data)
procedure dequeue;
begin
  if (front = 0) or (front > rear) then
  begin
    writeln('Queue kosong!');
    front := 0; rear := 0;  // reset ke kondisi kosong
  end
  else
  begin
    writeln(queue[front], ' dikeluarkan dari queue.');
    front := front + 1;     // geser front ke depan
  end;
end;

// Prosedur untuk menampilkan isi queue
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
  front := 0; rear := 0;  // awalnya queue kosong

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
