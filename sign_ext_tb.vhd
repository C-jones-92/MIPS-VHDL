----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Sign Extension Unit testbench
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sign_ext_tb is
end sign_ext_tb;

architecture Behavioral of sign_ext_tb is

component sign_ext is
  Port ( data_in : in std_logic_vector(15 downto 0);
         data_out : out std_logic_vector(31 downto 0));
end component sign_ext;

signal data_in_tb : std_logic_vector(15 downto 0);
signal data_out_tb : std_logic_vector(31 downto 0);

begin

    uut: sign_ext port map(
        data_in => data_in_tb,
        data_out => data_out_tb
        );
        
    simulation : process
    begin
        data_in_tb <= x"0000";
        wait for 10ns;
        data_in_tb <= x"f000";
        wait for 10ns;
    end process simulation;
    
end Behavioral;
