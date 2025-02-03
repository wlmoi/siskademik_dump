-----------------------------------------------------------------------------------------------------
-- Nama		: Muhammad Nabil Raihan
-- NIM		: 13223014
-- Rombongan	: B
-- Kelompok	: 2
-- Percobaan	: 2
-- Tanggal	: 14 Oktober 2024
-----------------------------------------------------------------------------------------------------
-- Deskripsi
-- Fungsi	: Mengonversi X (5 bit binary) menjadi A (BCD puluhan) dan B (BCD satuan)
-- Input	: X
-- Output	: A, B					Konversi BCD dari X
-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
    use ieee.std_logic_1164.all;

-- Define entity
entity BCD_2digits is
    -- Define port
    port(
        -- port input
        X    : in  std_logic_vector(4 downto 0); 
        -- port output 
        A, B : out std_logic_vector(3 downto 0));
end BCD_2digits;

-- Define architecture
architecture rtl of BCD_2digits is
begin
    -- BCD puluhan
    A(3) <= '0';
    A(2) <= '0';
    A(1) <= (X(2) and X(4)) or (X(3) and X(4));
    A(0) <= (X(2) and X(3) and not X(4)) or (X(1) and X(3) and not X(4)) or 
            (not X(2) and not X(3) and X(4)) or (X(1) and X(2) and X(3));

    -- BCD satuan
    B(3) <= (not X(1) and not X(2) and X(3) and not X(4)) or (not X(1) and X(2) and X(3) and X(4)) or 
            (X(1) and not X(2) and not X(3) and X(4));
    B(2) <= (X(2) and not X(3) and not X(4)) or (X(1) and X(2) and not X(4)) or 
            (not X(1) and not X(2) and X(4)) or (not X(2) and X(3) and X(4));
    B(1) <= (not X(1) and X(2) and X(3) and not X(4)) or (X(1) and not X(3) and not X(4)) or 
            (X(1) and X(2) and not X(3)) or (not X(1) and not X(2) and not X(3) and X(4)) or 
            (X(1) and not X(2) and X(3) and X(4));
    B(0) <= X(0);
end rtl;
-----------------------------------------------------------------------------------------------------