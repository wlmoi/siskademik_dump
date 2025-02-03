-- Nama         : William Anthony
-- NIM          : 13223048
-- Rombongan    : C
-- Kelompok     : 6
-- Percobaan    : 1
-- Tanggal      : 11 November 2024
-- Deskripsi Program : BCD to 7-Segment Converter (Active Low)
-- Fungsi       : Mengonversi sinyal BCD 4-bit menjadi output untuk 7-segment (Active Low).

library ieee;
use ieee.std_logic_1164.all;

entity BCD_to_7Segment is
    port (
        BCD_in  : in  std_logic_vector(0 to 3);  -- BCD input (4-bit)
        Seg_out : out std_logic_vector(0 to 6)   -- 7-segment display output (Active Low)
        -- Segment 0: Top segment
        -- Segment 1: Top right
        -- Segment 2: Bottom right
        -- Segment 3: Bottom
        -- Segment 4: Bottom left
        -- Segment 5: Top left
        -- Segment 6: Middle
    );
end BCD_to_7Segment;

architecture Behavioral of BCD_to_7Segment is
begin
    process(BCD_in)
    begin
        case BCD_in is
            when "0000" => Seg_out <= "0000001";  -- 0
            when "0001" => Seg_out <= "1001111";  -- 1
            when "0010" => Seg_out <= "0010010";  -- 2
            when "0011" => Seg_out <= "0000110";  -- 3
            when "0100" => Seg_out <= "1001100";  -- 4
            when "0101" => Seg_out <= "0100100";  -- 5
            when "0110" => Seg_out <= "0100000";  -- 6
            when "0111" => Seg_out <= "0001111";  -- 7
            when "1000" => Seg_out <= "0000000";  -- 8
            when "1001" => Seg_out <= "0000100";  -- 9
            when others => Seg_out <= "1111111";  -- All segments off (invalid BCD)
        end case;
    end process;
end Behavioral;
