----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Branch Control Unit testbench
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity branch_cntl_tb is
end branch_cntl_tb;

architecture Behavioral of branch_cntl_tb is

component branch_cntl is
    Port    (branch: in std_logic_vector(1 downto 0);
             zero: in std_logic;
             cntl_out: out std_logic);
end component branch_cntl;

signal branch_tb : std_logic_vector(1 downto 0);
signal zero_tb : std_logic;
signal cntl_out_tb : std_logic;

begin

    uut: branch_cntl port map (
        branch => branch_tb,
        zero => zero_tb,
        cntl_out => cntl_out_tb
        );
    
    simulation : process
    begin
        zero_tb <= '1';
        branch_tb <= "00";
        wait for 10ns;
        branch_tb <= "01";
        wait for 10ns;
        branch_tb <= "10";
        wait for 10ns;
        zero_tb <= '0';
        branch_tb <= "00";
        wait for 10ns;
        branch_tb <= "01";
        wait for 10ns;
        branch_tb <= "10";
        wait for 10ns;

    end process simulation;
end Behavioral;
