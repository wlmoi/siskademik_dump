-----------------------------------------------------------------------------------------------------
-- Nama		: Muhammad Nabil Raihan
-- NIM		: 13223014
-- Rombongan: B
-- Kelompok	: 2
-- Percobaan: 3
-- Tanggal	: 15 November 2024
-----------------------------------------------------------------------------------------------------
-- Deskripsi
-- Fungsi	: Mengurangkan nilai A dengan B
-- Input	: A, B                      Input data
-- Output	: S					        Hasil pengurangan A-B
-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- Define entity
entity subtractor_4bit is
    -- Define port
    port (
        -- port input
        A, B    : in  std_logic_vector(3 downto 0);
        -- port output
        S       : out std_logic_vector(3 downto 0));
end entity;

-- Define architecture
architecture behavior of subtractor_4bit is
begin
    S <= std_logic_vector(unsigned(A) - unsigned(B));
end architecture;
-----------------------------------------------------------------------------------------------------