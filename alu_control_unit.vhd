----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: ALU Control Unit
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu_control is
    Port    (funct: in std_logic_vector(5 downto 0);
             aluop: in std_logic_vector(5 downto 0);
             ALU_cntl: out std_logic_vector(3 downto 0));
end alu_control;

architecture Behavioral of alu_control is

begin
    
    process (aluop, funct)
    begin
        if aluop = "000000" then --lw/sw
            ALU_cntl <= "0001"; 
        elsif aluop = "000010" then --R type instructions
            case funct is
                when "100000" => ALU_cntl <= "0001"; --add
                when "100001" => ALU_cntl <= "0010"; --addu
                when "100010" => ALU_cntl <= "0011"; --sub
                when "100011" => ALU_cntl <= "0100"; --subu
                when "100100" => ALU_cntl <= "0101"; --AND
                when "100101" => ALU_cntl <= "0110"; --OR
                when "100110" => ALU_cntl <= "0111"; --XOR
                when "100111" => ALU_cntl <= "1000"; --NOR
                when "101000" => ALU_cntl <= "1001"; --slt
                when "101001" => ALU_cntl <= "1010"; --sltu
                when "001000" => ALU_cntl <= "1011"; -- jr
                when others => ALU_cntl <= "0000";
             end case;
        elsif aluop = "000100"  or aluop = "000101" then --beq and bne 
            ALU_cntl <= "0011"; 
        elsif aluop = "001000" then --addi 
            ALU_cntl <= "0001";
        elsif aluop = "001001" then --addiu 
            ALU_cntl <= "0010";
        elsif aluop = "001100" then --andi 
            ALU_cntl <= "0101";
        elsif aluop = "001101" then --ori 
            ALU_cntl <= "0110";
        elsif aluop = "001010" then --slti 
            ALU_cntl <= "1001";
        elsif aluop = "001011" then --sltiu 
            ALU_cntl <= "1010";        
        end if;    
  end process;              
end Behavioral;
