----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 06/25/2020
-- Module Name: PC Adder Testbench
-- Project Name: Lab 2 - R-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pcadd_tb is
end pcadd_tb;

architecture Behavioral of pcadd_tb is

component pcadd is
    Port (Din   : in  STD_LOGIC_VECTOR (31 downto 0);
          Dout  : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal Din_tb : std_logic_vector (31 downto 0);
signal Dout_tb : std_logic_vector (31 downto 0);

begin

    uut: pcadd port map (
        Din => Din_tb,
        Dout => Dout_tb
        );

    simulation : process
    begin
        Din_tb <= x"00000000";
        for i in 0 to 10 loop
            wait for 10ns;
            Din_tb <= Dout_tb;
        end loop;
    end process simulation;
end Behavioral;
