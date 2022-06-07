----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Branch Adder testbench
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity branch_adder_tb is
end branch_adder_tb;

architecture Behavioral of branch_adder_tb is

component branch_adder is
    Port ( pcadd, shift_left2   : in  std_logic_vector(31 downto 0);
          alu_out  : out  std_logic_vector(31 downto 0));
end component branch_adder;

signal pcadd_tb, shift_left2_tb : std_logic_vector(31 downto 0);
signal alu_out_tb : std_logic_vector(31 downto 0);

begin

    uut: branch_adder port map(
        pcadd => pcadd_tb,
        shift_left2 => shift_left2_tb,
        alu_out => alu_out_tb
        );
        
    simulation : process
    begin
        pcadd_tb <= x"00000000";
        shift_left2_tb <= x"10101010";
        for i in 0 to 5 loop
            pcadd_tb <= x"00000001";
            wait for 10ns;
        end loop;
    end process simulation;

end Behavioral;
