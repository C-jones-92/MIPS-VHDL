----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Write Register Multiplexor
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity regdst_mux is
  Port ( rd, rt : in std_logic_vector(4 downto 0);
         regdst : in std_logic_vector(1 downto 0);
         mux_out : out std_logic_vector(4 downto 0));
end regdst_mux;

architecture Behavioral of regdst_mux is

begin

    with regdst select
        mux_out <=  "11111" when "10",
                    rd when "01",
                    rt when "00",
                    "00000" when others;
                
end Behavioral;
