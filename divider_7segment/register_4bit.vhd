-----------------------------------------------------------------------------------------------------
-- Nama		: Muhammad Nabil Raihan
-- NIM		: 13223014
-- Rombongan: B
-- Kelompok	: 2
-- Percobaan: 3
-- Tanggal	: 15 November 2024
-----------------------------------------------------------------------------------------------------
-- Deskripsi
-- Fungsi	: Menyimpan nilai A setiap clock naik
-- Input	: A                         Input data
--            En                        Enable
--            Reset                     Reset
--            Clk                       Clock
-- Output	: A_out					    Keluaran data
-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
    use ieee.std_logic_1164.all;

-- Define entity
entity register_4bit is
    -- Define port
    port (
        -- port input
        A                   : in std_logic_vector(3 downto 0);
        En                  : in std_logic;
        Reset               : in std_logic;
        Clk                 : in std_logic;
        -- port output
        A_out               : out std_logic_vector(3 downto 0));
end register_4bit;

-- Define architecture
architecture behavior of register_4bit is
    -- Define signal
    signal Data             : std_logic_vector(3 downto 0) := "0000";
begin
    process (Clk)
    begin
        if rising_edge(Clk) then
            if Reset = '1' then         -- Mengembalikan nilai default
                Data <= "0000";
            else
                if En = '1' then        -- Menjalankan fungsi register
                    Data <= A;
                end if;
            end if;
        end if;
    end process;
    -- Assign nilai output
    A_out <= Data;
end behavior;
-----------------------------------------------------------------------------------------------------