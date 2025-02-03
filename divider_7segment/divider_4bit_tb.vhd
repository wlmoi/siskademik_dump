-----------------------------------------------------------------------------------------------------
-- Nama		: Muhammad Nabil Raihan
-- NIM		: 13223014
-- Rombongan: B
-- Kelompok	: 2
-- Percobaan: 3
-- Tanggal	: 15 November 2024
-----------------------------------------------------------------------------------------------------
-- Deskripsi
-- Fungsi	: Membagi nilai A dengan B dan menampilkan hasil serta sisa pembagian
-- Input	: A                         Pembilang
--            B                         Pembagi
--            Start                     Mulai
--            Stop                      Penghenti
--            Clk                       Clock
-- Output	: C                         Sisa pembagian
--            D                         Hasil pembagian
-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Define entity
entity divider_4bit_tb is
end entity;

-- Define architecture
architecture behavior of divider_4bit_tb is
    -- Define component
    component divider_4bit
        port (
            -- port input
            A, B             : in  std_logic_vector(3 downto 0);
            Start, Stop, Clk : in  std_logic;
            -- port output
            C, D             : out std_logic_vector(3 downto 0));
    end component;

    -- Define signal
    signal Clk          : std_logic                := '0';
    signal Start        : std_logic                := '0';
    signal Stop         : std_logic                := '0';
    signal A            : std_logic_vector(0 to 3) := "0000";
    signal B            : std_logic_vector(0 to 3) := "0000";
    signal C            : std_logic_vector(0 to 3);
    signal D            : std_logic_vector(0 to 3);
    constant clk_period : time := 10 ns;

begin
    dut: divider_4bit
    port map(
        A       => A,
        B       => B,
        Start   => Start,
        Stop    => Stop,
        Clk     => Clk,
        C       => C,
        D       => D);

    clk_process: process
    begin
        Clk <= '0';
        wait for clk_period / 2;
        Clk <= '1';
        wait for clk_period / 2;
    end process;

    stimulus_process: process
    begin
      -- Reset awal
      Start <= '0';
      Stop <= '0';
      A <= "0110"; -- A = 6
      B <= "0011"; -- B = 3
      wait for 5 ns;

      -- Mulai perhitungan
      Start <= '1';
      wait for 20 ns;
      Start <= '0';
      wait for 40 ns;
      Stop <= '1';
      wait for 20 ns;
      Stop <= '0';

      -- Uji dengan nilai baru
      A <= "1001"; -- A = 9
      B <= "0011"; -- B = 3
      wait for 5 ns;

      Start <= '1';
      wait for 30 ns;
      Stop <= '1';
      wait for 40 ns;
      Start <= '0';
      wait for 20 ns;
      Stop <= '0';

      -- Uji dengan nilai baru
        A <= "1010"; -- A = 10
        B <= "0000"; -- B = 0
        wait for 5 ns;

      -- Mulai perhitungan
        Start <= '1';
        wait for 20 ns;
        Start <= '0';
        wait for 40 ns;
        Stop <= '1';
        wait for 5 ns;
        Stop <= '0';

      -- Uji dengan nilai baru
        A <= "1101"; -- A = 13
        B <= "0011"; -- B = 0
        wait for 5 ns;

        -- Mulai perhitungan
        Start <= '1';
        wait for 20 ns;
        Start <= '0';
    end process;


end architecture;
-----------------------------------------------------------------------------------------------------
