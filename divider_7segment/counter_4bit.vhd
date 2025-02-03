-----------------------------------------------------------------------------------------------------
-- Nama		: Muhammad Nabil Raihan
-- NIM		: 13223014
-- Rombongan: B
-- Kelompok	: 2
-- Percobaan: 3
-- Tanggal	: 15 November 2024
-----------------------------------------------------------------------------------------------------
-- Deskripsi
-- Fungsi	: Menghitung tiap clock naik dengan batas 4 bit
-- Input	: En                        Enable
--            Reset                     Reset
--            Clk                       Clock
-- Output	: Count					    Hasil menghitung
-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- Define entity
entity counter_4bit is
    -- Define port
    port (
        -- port input
        En, Reset, Clk  : in  std_logic;
        -- port output
        Count           : out std_logic_vector(3 downto 0));
end counter_4bit;

-- Define architecture
architecture behavior of counter_4bit is
    -- Define signal
    signal Count_temp : unsigned(3 downto 0) := "0000";
begin
    process (Clk)
    begin
        if rising_edge(Clk) then
            if Reset = '1' then                     -- Mengembalikan nilai default
                Count_temp <= "0000";
            else
                if En = '1' then                    -- Menjalankan fungsi counter
                    Count_temp <= Count_temp + 1;
                end if;
            end if;
        end if;
    end process;
    -- Assign nilai output
    Count <= std_logic_vector(Count_temp);
end architecture;
-----------------------------------------------------------------------------------------------------