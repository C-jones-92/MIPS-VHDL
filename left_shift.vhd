----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Left-Shift Unit
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity left_shift is
  Port ( data_in : in std_logic_vector(31 downto 0);
         data_out : out std_logic_vector(31 downto 0));
end left_shift;

architecture Behavioral of left_shift is

begin
    data_out <= data_in(29 downto 0) & "00";
end Behavioral;
