----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Branch Multiplexor testbench
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity branch_mux_tb is
end branch_mux_tb;

architecture Behavioral of branch_mux_tb is

component branch_mux is
  Port ( branch_cntl : in std_logic;
         branch_adder_result, pcadder : in std_logic_vector(31 downto 0);
         mux_out : out std_logic_vector(31 downto 0));
end component branch_mux;

signal branch_cntl_tb : std_logic;
signal branch_adder_result_tb, pcadder_tb : std_logic_vector(31 downto 0);
signal mux_out_tb : std_logic_vector(31 downto 0);

begin
    uut: branch_mux port map(
        branch_cntl => branch_cntl_tb,
        branch_adder_result => branch_adder_result_tb,
        pcadder => pcadder_tb,
        mux_out => mux_out_tb
        );

    simulation : process
    begin
        branch_adder_result_tb <= x"00001111";
        pcadder_tb <= x"10101010";
        branch_cntl_tb <= '1';
        wait for 10ns;
        branch_cntl_tb <= '0';
        wait for 10ns;
    end process simulation;
end Behavioral;
