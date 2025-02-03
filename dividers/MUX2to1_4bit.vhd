-----------------------------------------------------------------------------------------------------
-- Nama		: Muhammad Nabil Raihan
-- NIM		: 13223014
-- Rombongan: B
-- Kelompok	: 2
-- Percobaan: 3
-- Tanggal	: 15 November 2024
-----------------------------------------------------------------------------------------------------
-- Deskripsi
-- Fungsi	: Memilih nilai input yang akan diteruskan
-- Input	: A,B                       Input data
--            s                         Selektor
-- Output	: Data					    Keluaran data
-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
  use ieee.std_logic_1164.all;

-- Define entity
entity mux2to1_4bit is
    -- Define port
    port (
        -- port input
        A,B     : in std_logic_vector(3 downto 0);
        s       : in std_logic;
        -- port output
        Data    : out std_logic_vector(3 downto 0));
end mux2to1_4bit;

-- Define architecture
architecture behavior of mux2to1_4bit is
begin
    process (s, A, B)
    begin
        if s = '1' then
            Data <= B;
        else
            Data <= A;
        end if;
    end process;
end architecture;
-----------------------------------------------------------------------------------------------------