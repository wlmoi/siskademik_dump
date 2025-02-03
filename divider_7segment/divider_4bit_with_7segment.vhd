library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

  -- Define entity

entity divider_with_7segment is
  -- Define port
  port (
    -- port input
    A, B                     : in  std_logic_vector(3 downto 0);
    Start, Stop, Clk         : in  std_logic;
    -- port output
    Segment7_C1, Segment7_C0 : out std_logic_vector(1 to 7); -- HEX 1, HEX 0
    Segment7_D1, Segment7_D0 : out std_logic_vector(1 to 7); -- HEX 5, HEX 4
    -- flag
    A_out, B_out             : out std_logic_vector(3 downto 0) ;
    stf : out std_logic_vector(4 downto 0) );
end entity;

-- Define architecture

architecture rtl of divider_with_7segment is
  -- Define component
  -- component adder_4bit
  component divider_4bit is
    -- Define port
      port (
        -- port input
        A, B             : in  std_logic_vector(3 downto 0);
        Start, Stop, Clk : in  std_logic;
        -- port output
        C, D             : out std_logic_vector(3 downto 0));
  end component;

  -- component BCD_2digits
  component BCD_2digits is
    port (
      -- port input BCD_2digits
      X    : in  std_logic_vector(4 downto 0);
      -- port output BCD_2digits
      A, B : out std_logic_vector(3 downto 0));
  end component;

  -- component seven_segment
  component BCD_to_7Segment  is
    port (
      -- port input seven_segment
        BCD_in  : in  std_logic_vector(0 to 3);  -- BCD input (4-bit)
        Seg_out : out std_logic_vector(0 to 6)   -- 7-segment display output (Active Low)
    );
  end component;



  -- Define signal
  signal C, D             : std_logic_vector(3 downto 0);
  signal C_5bit : std_logic_vector(4 downto 0); -- Bentuk 5 bit dari C
  signal C1, C0 : std_logic_vector(3 downto 0); -- BCD 2 digit dari C
  signal D_5bit : std_logic_vector(4 downto 0); -- Bentuk 5 bit dari D
  signal D1, D0 : std_logic_vector(3 downto 0); -- BCD 2 digit dari D

begin
  -- Assign nilai signal A dan B 5 bit
  C_5bit(4)          <= '0';
  D_5bit(4)          <= '0';

  -- Assign flag
  A_out        <= A;
  B_out        <= B;

  -- Mapping component pemrosesan
  divider         : divider_4bit port map (A, B, Start, Stop, Clk , C_5bit(3 downto 0), D_5bit(3 downto 0));
  BCD_2digits_C   : BCD_2digits port map (C_5bit, C1, C0);
  BCD_2digits_D   : BCD_2digits port map (D_5bit, D1, D0);

  -- Mapping 7 segment
  Segment7_C_0    : BCD_to_7Segment port map (C0, Segment7_C0);
  Segment7_C_1    : BCD_to_7Segment port map (C1, Segment7_C1);
  Segment7_D_0    : BCD_to_7Segment port map (D0, Segment7_D0);
  Segment7_D_1    : BCD_to_7Segment port map (D1, Segment7_D1);

  stf <= C_5bit;
end rtl;
