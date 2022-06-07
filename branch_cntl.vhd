----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Branch Control Unit
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity branch_cntl is
    Port    (branch: in std_logic_vector(1 downto 0);
             zero: in std_logic;
             cntl_out: out std_logic);
end branch_cntl;

architecture Behavioral of branch_cntl is

begin
    process (branch)
    begin
        if (branch = "01") and (zero = '1') then --branch on equal instruction
            cntl_out <= '1'; 
        elsif (branch = "10") and (zero = '0') then --branch on not equal instruction
            cntl_out <= '1';
        else
            cntl_out <= '0'; 
        end if;    
  end process;              
end Behavioral;
