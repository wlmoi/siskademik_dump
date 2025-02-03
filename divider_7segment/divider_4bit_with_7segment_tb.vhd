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
entity tb_divider_with_7segment is
-- Test bench has no ports
end tb_divider_with_7segment;


-- Define architecture
architecture behavior of tb_divider_with_7segment is
    -- Define component
    component divider_with_7segment
        port (
            -- port input
            A, B             : in  std_logic_vector(3 downto 0);
            Start, Stop, Clk : in  std_logic;
            stf              : out std_logic_vector(4 downto 0);
    -- port output
    Segment7_C1, Segment7_C0 : out std_logic_vector(1 to 7); -- HEX 1, HEX 0
    Segment7_D1, Segment7_D0 : out std_logic_vector(1 to 7); -- HEX 5, HEX 4
    -- flag
    A_out, B_out             : out std_logic_vector(3 downto 0) );
    end component;

    -- Define signal
    signal Clk          : std_logic                := '0';
    signal Start        : std_logic                := '0';
    signal Stop         : std_logic                := '0';
    signal A            : std_logic_vector(0 to 3) := "0000";
    signal B            : std_logic_vector(0 to 3) := "0000";
    signal stf          : std_logic_vector(4 downto 0);

    signal Segment7_C1  :  std_logic_vector(1 to 7);
    signal Segment7_C0 :  std_logic_vector(1 to 7); -- HEX 1, HEX 0
    signal Segment7_D1 :  std_logic_vector(1 to 7);
    signal Segment7_D0 : std_logic_vector(1 to 7); -- HEX 5, HEX 4
    constant clk_period : time := 20 ns;

begin
    dut: divider_with_7segment
    port map(
        A       => A,
        B       => B,
        Start   => Start,
        Stop    => Stop,
        Clk     => Clk,
         Segment7_C1      =>  Segment7_C1,
         Segment7_C0      =>  Segment7_C0,
        Segment7_D1       => Segment7_D1,
        Segment7_D0       => Segment7_D0,
        stf              => stf);

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
      A <= "0100"; -- A = 1
      B <= "0001"; -- B = 1
      wait for 10 ns ;

      -- Mulai perhitungan
      Start <= '1';
      wait for 20 ns ;
      Start <= '0';
      wait for 20 ns;
      Stop <= '0';
      
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '0';
      
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '1';
      wait for 20 ns;

            -- Reset awal
      Start <= '0';
      Stop <= '0';
      A <= "0001"; -- A = 1
      B <= "0011"; -- B = 1
      wait for 10 ns ;

      -- Mulai perhitungan
      Start <= '1';
      wait for 20 ns ;
      Start <= '0';
      wait for 20 ns;
      Stop <= '0';
      
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '0';
      
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '1';
      wait for 20 ns;

            -- Reset awal
      Start <= '0';
      Stop <= '0';
      A <= "0101"; -- A = 1
      B <= "0011"; -- B = 1
      wait for 10 ns ;

      -- Mulai perhitungan
      Start <= '1';
      wait for 20 ns ;
      Start <= '0';
      wait for 20 ns;
      Stop <= '0';
      
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '0';
      
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '0';
      wait for 20 ns;
      Stop <= '1';
      wait for 20 ns;

      

    end process;


end architecture;
-----------------------------------------------------------------------------------------------------
