----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 06/25/2020
-- Module Name: PC
-- Project Name: Lab 2 - R-type Datapath
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity alu_cntl_tb is
end alu_cntl_tb;

architecture Behavioral of alu_cntl_tb is

component alu_control is
    Port    (funct: in std_logic_vector(5 downto 0);
             aluop: in std_logic_vector(5 downto 0);
             ALU_cntl: out std_logic_vector(3 downto 0));
end component;

signal funct_tb : std_logic_vector (5 downto 0);
signal aluop_tb : std_logic_vector (5 downto 0);
signal ALU_cntl_tb : std_logic_vector (3 downto 0);

begin

    uut: alu_control port map(
        funct => funct_tb,
        aluop => aluop_tb,
        ALU_cntl => ALU_cntl_tb
        );
        
    simulation : process
        begin
            aluop_tb <= "000000";
            wait for 10ns;
            aluop_tb <= "000010";
            wait for 10ns;
            funct_tb <= "100000"; --add
            wait for 10ns;
            funct_tb <= "100001"; --addu
            wait for 10ns;
            funct_tb <= "100010"; --sub
            wait for 10ns;
            funct_tb <= "100011"; --subu
            wait for 10ns;
            funct_tb <= "100100"; --and
            wait for 10ns;
            funct_tb <= "100101"; --or
            wait for 10ns;
            funct_tb <= "100110"; --xor
            wait for 10ns;
            funct_tb <= "100111"; --nor
            wait for 10ns;
            funct_tb <= "101000"; --slt
            wait for 10ns;
            funct_tb <= "101001"; --sltu
            wait for 10ns;
            aluop_tb <= "000100";
            wait for 10ns;
            aluop_tb <= "000101";
            wait for 10ns;
            aluop_tb <= "001000";
            wait for 10ns;
            aluop_tb <= "001001";
            wait for 10ns;
            aluop_tb <= "001100";
            wait for 10ns;
            aluop_tb <= "001001";
            wait for 10ns;
            aluop_tb <= "001010";
            wait for 10ns;
            aluop_tb <= "001011";
            wait for 10ns;
            
end process;
    
end Behavioral;
