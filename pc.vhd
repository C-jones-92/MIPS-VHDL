----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 06/25/2020
-- Module Name: PC
-- Project Name: Lab 2 - R-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc is
    Port    (PC_in: in std_logic_vector(31 downto 0);
             clk: in std_logic;
             reset: in std_logic;
             PC_out: out std_logic_vector(31 downto 0));
end pc;

architecture Behavioral of pc is

begin
    process(clk)
    begin
       
    if (clk' event) and (clk = '1') then
        if (reset = '0') then PC_out <= PC_in;
        else PC_out <= x"00000000";
        end if;
    end if;
    
    if reset = '1' then PC_out <= x"00000000";
    end if;
    end process;
end Behavioral;
