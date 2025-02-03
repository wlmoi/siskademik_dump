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
entity divider_4bit is
    -- Define port
    port (
        -- port input
        A, B                : in  std_logic_vector(3 downto 0);
        Start, Stop, Clk    : in std_logic;
        -- port output
        C, D                : out std_logic_vector(3 downto 0));
end entity;

-- Define architecture
architecture behavior of divider_4bit is
    -- Define components
    component register_4bit
        -- Define port
        port (
            -- port input
            A     : in  std_logic_vector(3 downto 0);
            En    : in  std_logic;
            Reset : in  std_logic;
            Clk   : in  std_logic;
            -- port output
            A_out : out std_logic_vector(3 downto 0));
    end component;

    component mux2to1_4bit
        -- Define port
        port (
            -- port input
            A, B : in  std_logic_vector(3 downto 0);
            s    : in  std_logic;
            -- port output
            Data : out std_logic_vector(3 downto 0));
    end component;

    component counter_4bit
        -- Define port
        port (
            -- port input
            En, Reset, Clk : in  std_logic;
            -- port output
            Count          : out std_logic_vector(3 downto 0));
    end component;

    component comparator_less_4bit
        -- Define port
        port (
            -- port input
            A, B : in  std_logic_vector(3 downto 0);
            -- port output
            Less : out std_logic);
    end component;

    component subtractor_4bit
        -- Define port
        port (
            -- port input
            A, B : in  std_logic_vector(3 downto 0);
            -- port output
            S    : out std_logic_vector(3 downto 0));
    end component;

    -- Define state
    type state_type is (Init, Set, Calculate, Final);

    -- Define signal
    signal state                                    : state_type := Init;
    signal En_reg_A, En_reg_B, En_counter           : std_logic := '0';
    signal Reset_reg_A, Reset_reg_B, Reset_counter  : std_logic := '0';
    signal Sub                                      : std_logic_vector(3 downto 0) := "0000";
    signal Sel                                      : std_logic := '0';
    signal Reg_A_in, Reg_A_out, Reg_B_out           : std_logic_vector(3 downto 0) := "0000";
    signal S_Less                                   : std_logic := '0';

begin
    -- Mapping port
    register_A  : register_4bit
    port map(
        A       => Reg_A_in,
        En      => En_reg_A,
        Reset   => Reset_reg_A,
        Clk     => Clk,
        A_out   => Reg_A_out);

    register_B: register_4bit
    port map (
        A     => B,
        En    => En_reg_B,
        Reset => Reset_reg_B,
        Clk   => Clk,
        A_out => Reg_B_out);

    mux_A       : mux2to1_4bit
    port map (
        A       => A,
        B       => Sub,
        s       => Sel,           
        Data    => Reg_A_in);

    counter     : counter_4bit
    port map (
        En      => En_counter,
        Reset   => Reset_counter,
        Clk     => Clk,
        Count   => D);

    comparator  : comparator_less_4bit
    port map (
        A       => Reg_A_in,
        B       => Reg_B_out,
        Less    => S_Less );
    
    subtractor  : subtractor_4bit
    port map (
        A       => Reg_A_out,
        B       => Reg_B_out,
        S       => Sub);

    -- Proses kontrol
    process(Clk, state, S_Less)
    begin
        if Stop = '1' then
            state <= Init;
        else
            if rising_edge(Clk) then
                case state is
                    when Init =>
                        if Start = '1' and not (B = "0000") then
                            state <= Set;
                        end if;
                    when Set =>
                        state <= Calculate;
                    when Calculate =>
                        if S_less = '1' then
                            state <= Final;
                        end if;
                    when Final =>
                        state <= Final;
                end case;
            end if;
        end if;

        case state is
            when Init => 
                Reset_counter <= '1';
                Reset_reg_A <= '1';
                En_counter  <= '0';
                En_reg_B    <= '1';
            when Set =>
                Sel <= '0';
                Reset_counter <= '0';
                Reset_reg_A   <= '0';
                En_reg_A      <= '1';
                En_reg_B      <= '0';
            when Calculate =>
                En_counter <= '1';
                Sel <= '1';
            when Final =>
                En_counter <= '0';
                En_reg_A <= '0';
        end case;
    end process;
    C <= Reg_A_out;
end architecture;
-----------------------------------------------------------------------------------------------------