----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Branch Adder
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity branch_adder is
    Port ( pcadd, shift_left2   : in  std_logic_vector (31 downto 0);
          alu_out  : out  std_logic_vector (31 downto 0));
end branch_adder; 

architecture Behavioral of branch_adder is
begin
    alu_out <= pcadd + shift_left2;
end Behavioral;


