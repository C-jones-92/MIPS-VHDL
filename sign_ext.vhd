----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Sign Extension Unit
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity sign_ext is
  Port ( data_in : in std_logic_vector(15 downto 0);
         data_out : out std_logic_vector(31 downto 0));
end sign_ext;

architecture Behavioral of sign_ext is

begin
    with data_in(15) select
        data_out <= (x"0000" & data_in) when '0',
                    (x"ffff" & data_in) when '1',
                    x"00000000"         when others;
end Behavioral;
