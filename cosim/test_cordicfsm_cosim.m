% Skrip Pengujian FSM dengan CORDIC
% -----------------------------------
% Definisi tipe input:
% Cordic_on : int (0 atau 1) - Sinyal kontrol untuk memulai CORDIC
% x_in      : double         - Koordinat X untuk operasi CORDIC
% y_in      : double         - Koordinat Y untuk operasi CORDIC
clear;
clc;
% Parameter input
Cordic_on = 1;
% [int] Sinyal untuk memulai CORDIC (0: OFF, 1: ON)
x_in = 300.0;
% [double] Input X untuk CORDIC
y_in = 400.0;
% [double] Input Y untuk CORDIC
% Variabel keluaran
num_cycles = 36;
% [int] Jumlah siklus simulasi
disp( '--- Mulai Simulasi FSM dengan CORDIC ---' );
for cycle = 1:num_cycles
    % Panggil fungsi utama
    [Z,r,p,x_out,y_out] = cordicfsm_wrapper_fixpt_cosim( Cordic_on, x_in, y_in );
    % Tampilkan hasil
    disp( [ 'Cycle: ', num2str( cycle ) ] );
    disp( [ '  Z (Status Selesai): ', num2str( Z ) ] );
    disp( [ '  r_cordic (Radius): ', num2str( r ) ] );
    disp( [ '  p_cordic (Sudut, derajat): ', num2str( p ) ] );
    disp( [ '  x_out (Output X): ', num2str( x_out ) ] );
    disp( [ '  y_out (Output Y): ', num2str( y_out ) ] );
    % Nonaktifkan Cordic_on setelah siklus pertama untuk mensimulasikan pulsa
    if cycle==1
        Cordic_on = 0;  % [int] Memastikan simulasi berjalan hanya di siklus pertama
    end
    % Tambahkan jeda untuk membaca hasil dengan lebih jelas (opsional)
    pause( 0.1 );
end
disp( '--- Simulasi Selesai ---' );
