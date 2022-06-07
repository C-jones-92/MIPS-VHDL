----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 06/25/2020
-- Module Name: PC Adder
-- Project Name: Lab 2 - R-type Datapath
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity pcadd is
    Port (Din   : in  std_logic_vector (31 downto 0);
          Dout  : out  std_logic_vector (31 downto 0));
end pcadd; 

architecture Behavioral of pcadd is
begin
    Dout <= Din + x"0004";
end Behavioral;


