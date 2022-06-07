----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 06/25/2020
-- Module Name: PC
-- Project Name: Lab 2 - R-type Datapath
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.NUMERIC_STD.all;


entity alu_tb is
end alu_tb;

architecture Behavioral of alu_tb is

component alu is
        Port (A, B     : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUCntl  : in  STD_LOGIC_VECTOR (3 downto 0);
          Carryin  : in  STD_LOGIC;
          ALUOut   : out  STD_LOGIC_VECTOR (31 downto 0);
          Zero     : out  STD_LOGIC;
          Carryout : out std_logic;
          Overflow : out  STD_LOGIC);
end component;

signal A_tb : std_logic_vector (31 downto 0);
signal B_tb : std_logic_vector (31 downto 0);
signal ALUcntl_tb : std_logic_vector (3 downto 0);
signal carryin_tb : std_logic;
signal ALUout_tb : std_logic_vector (31 downto 0);
signal zero_tb : std_logic;
signal carryout_tb : std_logic;
signal Overflow_tb : std_logic;

begin

    uut: alu port map(
        A => A_tb,
        B => B_tb,
        ALUCntl => ALUCntl_tb,
        Carryin => Carryin_tb,
        ALUout => ALUout_tb,
        Zero => Zero_tb,
        Carryout => Carryout_tb,
        Overflow => Overflow_tb
        );
        
    simulation : process
        begin
        A_tb <= x"00000006"; B_tb <= x"0000000F"; ALUCntl_tb <= "0001"; 
        wait for 10ns;
        A_tb <= x"00000006"; B_tb <= x"0000000F"; ALUCntl_tb <= "0010"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "0011"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "0100"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "0101"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "0110"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "0111"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "1000"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "1001"; 
        wait for 10ns;
        A_tb <= x"FFFFFFF0"; B_tb <= x"0000000F"; ALUCntl_tb <= "1010"; 
        wait for 10ns;
    end process;
        
end Behavioral;
