----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 06/25/2020
-- Module Name: PC Testbench
-- Project Name: Lab 2 - R-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_tb is
end pc_tb;

architecture Behavioral of pc_tb is

component pc is
    Port    (PC_in: in std_logic_vector(31 downto 0);
             clk: in std_logic;
             reset: in std_logic;
             PC_out: out std_logic_vector(31 downto 0));
end component;

signal PC_in_tb: std_logic_vector(31 downto 0);
signal clk_tb: std_logic;
signal reset_tb: std_logic;
signal PC_out_tb: std_logic_vector(31 downto 0);

begin

    uut: pc port map (
        PC_in => PC_in_tb,
        clk => clk_tb,
        reset => reset_tb,
        PC_out => PC_out_tb);
    
    simulation : process
    begin
        reset_tb <= '0';
        PC_in_tb <= x"01010101";
        for i in 0 to 5 loop
            clk_tb <= '0';
            wait for 5ns;
            clk_tb <= '1';
            wait for 5ns;
        end loop;
        
        reset_tb <= '1';
        for i in 0 to 5 loop
            clk_tb <= '0';
            wait for 5ns;
            clk_tb <= '1';
            wait for 5ns;
        end loop;    
    end process simulation;
    
end Behavioral;
