-- Nama         : William Anthony
-- NIM          : 13223048
-- Tanggal      : 13 Desember 2024
-- Fungsi       : Mempersiapkan nilai desimal dari hasil LUT untuk CORDIC hingga 31 iterasi

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY LutTan IS
    PORT (
        iterasi  : IN  signed(4 downto 0);  -- Iterasi sebagai input (5 bit untuk mendukung hingga 31 iterasi)
        HasilLUT : OUT signed(15 downto 0) -- Hasil LUT dalam bentuk signed
    );
END LutTan;

ARCHITECTURE Behavioral OF LutTan IS
    -- Deklarasi tipe array untuk LUT
    TYPE lut_array IS ARRAY(0 TO 31) OF SIGNED(15 DOWNTO 0);

    -- Deklarasi konstanta LUT dengan nilai ArcTan (16-bit fixed-point)
    CONSTANT LUT_VALUES : lut_array := (
        TO_SIGNED(11520, 16),  -- ArcTan(2^0) = atan(1) ≈ 45° -> 45 * 2^13
        TO_SIGNED(6800, 16),   -- ArcTan(2^-1) = atan(0.5) ≈ 26.565° -> 26.565 * 2^13
        TO_SIGNED(3599, 16),   -- ArcTan(2^-2) = atan(0.25) ≈ 14.036° -> 14.036 * 2^13
        TO_SIGNED(1824, 16),   -- ArcTan(2^-3) = atan(0.125) ≈ 7.125° -> 7.125 * 2^13
        TO_SIGNED(916, 16),    -- ArcTan(2^-4) = atan(0.0625) ≈ 3.576° -> 3.576 * 2^13
        TO_SIGNED(458, 16),    -- ArcTan(2^-5) = atan(0.03125) ≈ 1.790° -> 1.790 * 2^13
        TO_SIGNED(229, 16),    -- ArcTan(2^-6) = atan(0.015625) ≈ 0.895° -> 0.895 * 2^13
        TO_SIGNED(114, 16),    -- ArcTan(2^-7) = atan(0.0078125) ≈ 0.448° -> 0.448 * 2^13
        TO_SIGNED(57, 16),     -- ArcTan(2^-8) = atan(0.00390625) ≈ 0.224° -> 0.224 * 2^13
        TO_SIGNED(29, 16),     -- ArcTan(2^-9) = atan(0.001953125) ≈ 0.112° -> 0.112 * 2^13
        TO_SIGNED(14, 16),     -- ArcTan(2^-10) = atan(0.0009765625) ≈ 0.056° -> 0.056 * 2^13
        TO_SIGNED(7, 16),      -- ArcTan(2^-11) = atan(0.00048828125) ≈ 0.028° -> 0.028 * 2^13
        TO_SIGNED(3, 16),      -- ArcTan(2^-12) = atan(0.000244140625) ≈ 0.014° -> 0.014 * 2^13
        TO_SIGNED(2, 16),      -- ArcTan(2^-13) = atan(0.0001220703125) ≈ 0.007° -> 0.007 * 2^13
        TO_SIGNED(1, 16),      -- ArcTan(2^-14) = atan(0.00006103515625) ≈ 0.0035° -> 0.0035 * 2^13
        TO_SIGNED(1, 16),      -- ArcTan(2^-15) = atan(0.000030517578125) ≈ 0.0018° -> 0.0018 * 2^13
        TO_SIGNED(0, 16),      -- ArcTan(2^-16) ≈ 0.0009° -> 0.0009 * 2^13
        TO_SIGNED(0, 16),      -- ArcTan(2^-17)
        TO_SIGNED(0, 16),      -- ArcTan(2^-18)
        TO_SIGNED(0, 16),      -- ArcTan(2^-19)
        TO_SIGNED(0, 16),      -- ArcTan(2^-20)
        TO_SIGNED(0, 16),      -- ArcTan(2^-21)
        TO_SIGNED(0, 16),      -- ArcTan(2^-22)
        TO_SIGNED(0, 16),      -- ArcTan(2^-23)
        TO_SIGNED(0, 16),      -- ArcTan(2^-24)
        TO_SIGNED(0, 16),      -- ArcTan(2^-25)
        TO_SIGNED(0, 16),      -- ArcTan(2^-26)
        TO_SIGNED(0, 16),      -- ArcTan(2^-27)
        TO_SIGNED(0, 16),      -- ArcTan(2^-28)
        TO_SIGNED(0, 16),      -- ArcTan(2^-29)
        TO_SIGNED(0, 16),      -- ArcTan(2^-30)
        TO_SIGNED(0, 16)       -- ArcTan(2^-31)
    );

BEGIN
    PROCESS (iterasi)
        VARIABLE index : INTEGER RANGE 0 TO 31;
    BEGIN
        -- Konversi iterasi ke integer
        index := to_integer(iterasi);
        -- Ambil nilai dari LUT berdasarkan indeks
        HasilLUT <= LUT_VALUES(index);
    END PROCESS;
END Behavioral;
