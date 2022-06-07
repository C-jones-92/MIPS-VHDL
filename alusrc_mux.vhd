----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: ALU Source Multiplexor
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity alusrc_mux is
  Port (sign_ext, read_data2 : in std_logic_vector(31 downto 0);
         alusrc : in std_logic;
         mux_out : out std_logic_vector(31 downto 0));
end alusrc_mux;

architecture Behavioral of alusrc_mux is

begin
    with alusrc select
        mux_out <=  sign_ext when '1',
                    read_data2 when '0',
                    x"00000000" when others;
end Behavioral;
