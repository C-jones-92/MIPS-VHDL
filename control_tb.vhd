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

entity control_tb is
end control_tb;

architecture Behavioral of control_tb is

component control is
    Port (Din: in std_logic_vector(5 downto 0);
          Dout: out std_logic);
end component;

signal Din_tb: std_logic_vector(5 downto 0);
signal Dout_tb: std_logic;


begin

    uut: control port map (
        Din => Din_tb,
        Dout => Dout_tb
            );
    
    simulation : process
    begin
        wait for 100ns;
    end process simulation;
end Behavioral;