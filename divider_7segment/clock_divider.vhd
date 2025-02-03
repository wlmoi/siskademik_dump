-----------------------------------------------------------------------------------------------------
-- Library
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- Define entity
entity clock_divider is
  -- Define port
  port (
    -- port input
    Clk_in          : in  std_logic;
    -- port output
    Clk_out         : out std_logic);
end entity;

architecture behavior of clock_divider is
    signal count : integer := 1;
    signal clk_tmp : std_logic := '0';

begin
    process (Clk_in)
    begin
        if rising_edge(Clk_in) then  
            if (count = 25000000) then
                count <= 1;
                clk_tmp <= not(clk_tmp);
            else
                count <= count + 1;
            end if;
        end if;
    Clk_out <= clk_tmp;
    end process;
end behavior;