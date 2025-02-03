-----------------------------------------------------------------------------------------------------
-- Nama		: Muhammad Nabil Raihan
-- NIM		: 13223014
-- Rombongan: B
-- Kelompok	: 2
-- Percobaan: 3
-- Tanggal	: 15 November 2024
-----------------------------------------------------------------------------------------------------
-- Deskripsi
-- Fungsi	: Membandingkan 2 nilai
-- Input	: A, B                      Input yang dibandingkan
-- Output	: Less				        Tanda A < B
-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- Define entity
entity comparator_less_4bit is
    -- Define port
    port (
        -- port input
        A, B            : in std_logic_vector(3 downto 0);
        -- port output
        Less            : out std_logic);
end entity;

-- Define architecture
architecture behavior of comparator_less_4bit is
begin
    Less <= '1' when (A < B) else '0';
end behavior;
-----------------------------------------------------------------------------------------------------