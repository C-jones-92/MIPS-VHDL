----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 06/25/2020
-- Module Name: Control Unit
-- Project Name: Lab 2 - R-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control is
    Port (cntl_in: in std_logic_vector(5 downto 0);
          jr : in std_logic_vector(31 downto 0);
          mem_read : out std_logic;
          mem_write, alu_src, reg_write : out std_logic;
          jump,reg_dst, mem_to_reg : out std_logic_vector(1 downto 0);
          branch : out std_logic_vector (1 downto 0);
          aluop : out std_logic_vector(5 downto 0));
end control;

architecture Behavioral of control is

begin
   
    process(cntl_in)
    begin
        if (cntl_in = "000000" and jr(5 downto 0) = "001000") then -- jr
            reg_dst <= "00";  
            alu_src <= '0';
            jump <= "10";
            mem_to_reg <= "00";
            reg_write <= '0';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "000010";
        elsif (cntl_in = "000000") then -- R-type instruction
            reg_dst <= "01";  
            alu_src <= '0';
            jump <= "00";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "000010";
        elsif (cntl_in = "001000") then --Add immediate
            reg_dst <= "00";  
            alu_src <= '1';
            jump <= "00";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001000";
        elsif (cntl_in = "001001") then --Add immediate unsigned
            reg_dst <= "00";  
            alu_src <= '0';
            jump <= "00";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001001";
        elsif (cntl_in = "001100") then --And immediate
            reg_dst <= "00";  
            alu_src <= '1';
            jump <= "00";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001100";
        elsif (cntl_in = "001101") then --Or Immediate
            reg_dst <= "00";  
            alu_src <= '1';
            jump <= "00";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001101";
        elsif (cntl_in = "100011") then --load word instruction
            reg_dst <= "00";  
            alu_src <= '1';
            jump <= "00";
            mem_to_reg <= "01";
            reg_write <= '1';
            mem_read <= '1';
            mem_write <= '0';
            branch <= "00";
            aluop <= "000000";
        elsif (cntl_in = "101011") then --store word instruction
            reg_dst <= "XX";  
            alu_src <= '1';
            jump <= "00";
            mem_to_reg <= "XX";
            reg_write <= '0';
            mem_read <= '0';
            mem_write <= '1';
            branch <= "00";
            aluop <= "000000";
        elsif (cntl_in = "000100") then --branch on equal instruction
            reg_dst <= "XX";  
            alu_src <= '0';
            jump <= "00";
            mem_to_reg <= "XX";
            reg_write <= '0';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "01";
            aluop <= "000100";
        elsif (cntl_in = "000101") then --branch on not equal instruction
            reg_dst <= "XX";  
            alu_src <= '0';
            jump <= "00";
            mem_to_reg <= "XX";
            reg_write <= '0';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "10";
            aluop <= "000101";
        elsif (cntl_in = "001010") then --Set Less Than Immediate instruction
            reg_dst <= "00";  
            alu_src <= '1';
            jump <= "00";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001010";
        elsif (cntl_in = "001011") then --set less than immediate unsigned instruction
            reg_dst <= "00";  
            alu_src <= '0';
            jump <= "00";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001011";
        elsif (cntl_in = "000010") then --j
            reg_dst <= "00";  
            alu_src <= '0';
            jump <= "01";
            mem_to_reg <= "00";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001011";
        elsif (cntl_in = "000011") then --jal
            reg_dst <= "10";  
            alu_src <= '0';
            jump <= "01";
            mem_to_reg <= "10";
            reg_write <= '1';
            mem_read <= '0';
            mem_write <= '0';
            branch <= "00";
            aluop <= "001011";
        end if;
    end process;

end Behavioral;
