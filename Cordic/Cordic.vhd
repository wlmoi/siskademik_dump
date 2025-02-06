LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Cordic IS
  PORT(
    clk             : IN  std_logic;
    reset           : IN  std_logic;
    clk_enable      : IN  std_logic;
    cordic_on       : IN  std_logic;
    x_in            : IN  SIGNED(10 DOWNTO 0);
    y_in            : IN  SIGNED(10 DOWNTO 0);
    clk_enable_out  : OUT std_logic := '0';
    z               : OUT std_logic;
    r_cordic        : OUT SIGNED(13 DOWNTO 0);
    p_cordic        : OUT SIGNED(16 DOWNTO 0);
    x_out           : OUT SIGNED(13 DOWNTO 0);
    y_out           : OUT SIGNED(13 DOWNTO 0)
  );
END Cordic;

ARCHITECTURE Behavioral OF Cordic IS
  TYPE state_type IS (IDLE, START, CALCULATE, STOP);
  SIGNAL state : state_type := IDLE;

  SIGNAL x, y, z_internal : SIGNED(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL px, py : SIGNED(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL iteration : SIGNED(4 DOWNTO 0) := (OTHERS => '0');
  SIGNAL arc_tan_lut : SIGNED(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL r_unadjusted : SIGNED(27 DOWNTO 0) := (OTHERS => '0');
  SIGNAL shifted_x, shifted_y : SIGNED(13 DOWNTO 0);

  COMPONENT W_RShift IS
    GENERIC(Size : INTEGER := 13);
    PORT(A : IN SIGNED(Size DOWNTO 0); Shift : IN INTEGER; Result : OUT SIGNED(Size DOWNTO 0));
  END COMPONENT;

  COMPONENT W_Multiplier IS
    GENERIC(Size : INTEGER := 14);
    PORT(A : IN SIGNED(Size DOWNTO 0); B : IN SIGNED(Size DOWNTO 0); Result : OUT SIGNED((2*Size) DOWNTO 0));
  END COMPONENT;

  COMPONENT LutTan IS
    PORT(
        iterasi  : IN  signed(4 downto 0);
        HasilLUT : OUT signed(15 downto 0)
    );
  END COMPONENT;

BEGIN
  -- Port mapping for W_RShift
  RShiftX_Instance: W_RShift GENERIC MAP (Size => 13) PORT MAP (A => x, Shift => to_integer(unsigned(iteration)), Result => shifted_x);
  RShiftY_Instance: W_RShift GENERIC MAP (Size => 13) PORT MAP (A => y, Shift => to_integer(unsigned(iteration)), Result => shifted_y);

  -- Multiplier for scaling x
  Multiplier_Instance: W_Multiplier GENERIC MAP (Size => 14) PORT MAP (A => x, B => to_signed(6072, 14), Result => r_unadjusted);

  -- LutTan instance
  LutTan_Instance: LutTan PORT MAP(iterasi => iteration, HasilLUT => arc_tan_lut);

  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      state <= IDLE;
      x <= (OTHERS => '0');
      y <= (OTHERS => '0');
      z_internal <= (OTHERS => '0');
      iteration <= (OTHERS => '0');
      z <= '0';
    ELSIF rising_edge(clk) THEN
      CASE state IS
        WHEN IDLE =>
          IF cordic_on = '1' THEN state <= START; END IF;

        WHEN START =>
          x <= RESIZE(x_in, 14);
          y <= RESIZE(y_in, 14);
          z_internal <= (OTHERS => '0');
          iteration <= (OTHERS => '0');
          state <= CALCULATE;

        WHEN CALCULATE =>
          IF to_integer(unsigned(iteration)) < 16 THEN
            px <= shifted_x;
            py <= shifted_y;
            IF y < 0 THEN
              z_internal <= z_internal + arc_tan_lut; -- Gunakan LUT
              x <= x - py;
              y <= y + px;
            ELSE
              z_internal <= z_internal - arc_tan_lut; -- Gunakan LUT
              x <= x + py;
              y <= y - px;
            END IF;
            iteration <= iteration + 1;
          ELSE
            state <= STOP;
          END IF;

        WHEN STOP =>
          r_cordic <= RESIZE(r_unadjusted(26 DOWNTO 13), 14);
          p_cordic <= RESIZE(z_internal, 16);
          x_out <= x;
          y_out <= y;
          z <= '1';
          state <= IDLE;

        WHEN OTHERS =>
          state <= IDLE;
      END CASE;
    END IF;
  END PROCESS;

END Behavioral;
