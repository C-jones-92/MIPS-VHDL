----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Branch Multiplexor
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity branch_mux is
  Port ( branch_cntl : in std_logic;
         branch_adder_result, pcadder : in std_logic_vector(31 downto 0);
         mux_out : out std_logic_vector(31 downto 0));
end branch_mux;

architecture Behavioral of branch_mux is

begin
    with branch_cntl select
        mux_out <=  branch_adder_result when '1',
                    pcadder             when '0',
                    x"00000000"         when others;

end Behavioral;
