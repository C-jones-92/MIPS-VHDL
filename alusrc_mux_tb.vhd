----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: ALU Source Multiplexor testbench
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alusrc_mux_tb is
end alusrc_mux_tb;

architecture Behavioral of alusrc_mux_tb is

component alusrc_mux is
  Port (sign_ext, read_data2 : in std_logic_vector(31 downto 0);
         alusrc : in std_logic;
         mux_out : out std_logic_vector(31 downto 0));
         
end component alusrc_mux;

signal sign_ext_tb , read_data2_tb : std_logic_vector(31 downto 0);
signal alusrc_tb : std_logic;
signal mux_out_tb : std_logic_vector(31 downto 0);

begin

    uut: alusrc_mux port map (
        sign_ext => sign_ext_tb,
        read_data2 => read_data2_tb,
        alusrc => alusrc_tb,
        mux_out => mux_out_tb
        );

    simulation : process
    begin
        read_data2_tb <= x"00000000";
        sign_ext_tb <= x"ffffffff";
        alusrc_tb <= '1';
        wait for 10ns;
        alusrc_tb <= '0';
        wait for 10ns;
    end process simulation;
         
end Behavioral;
