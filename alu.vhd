----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: ALU
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity ALU is
    Port (A, B     : in  STD_LOGIC_VECTOR (31 downto 0);
          ALUCntl  : in  STD_LOGIC_VECTOR (3 downto 0);
          Carryin  : in  STD_LOGIC;
          ALUOut   : out  STD_LOGIC_VECTOR (31 downto 0);
          Zero     : out  STD_LOGIC;
          Carryout : out std_logic;
          Overflow : out  STD_LOGIC);
end ALU; 


architecture Behavioral of ALU is
signal ALU_Result : std_logic_vector (31 downto 0);
signal add_result,sub_result,a32,b32: std_logic_vector(32 downto 0);
signal c32: std_logic_vector(32 downto 0):=(others=>'0');
signal add_ov,sub_ov:std_logic;
signal slt, sltu: std_logic_vector(31 downto 0);

begin
   with ALUCntl select
   ALU_Result <=add_result(31 downto 0) when "0001", --Add
                add_result(31 downto 0) when "0010", --Addu
                sub_result(31 downto 0) when "0011", --sub
                sub_result(31 downto 0) when "0100", --subu
                A AND B                 when "0101", --AND
                A OR  B                 when "0110", --OR
                A XOR B                 when "0111", --XOR
                A NOR B                 when "1000", --NOR
                slt                     when "1001", --slt
                sltu                    when "1010", --sltu
                A                       when "1011", --jr
                x"00000000" when others;---condition for all other alu control signals
ALUOut  <= ALU_Result; 
----Addition Operation and carry out generation-----	
   a32   <='0'& A;
   b32   <='0'& B;
   c32(0)<=Carryin;
   add_result<=a32 + b32;
   sub_result<=a32 - b32;
---Zero flag-----------------------------	
   Zero <= '1' when ALU_Result =x"00000000" else '0';
---Overflow flag---------------------------------------
   add_ov<= (A(31)and B(31)       and (not alu_result(31))) or ((not A(31))and (not B(31)) and alu_result(31));
   sub_ov<= (A(31)and (not B(31)) and (not alu_result(31))) or ((not A(31))and B(31)       and alu_result(31)); 
   with ALUCntl select
      Overflow<= add_ov when "0010",
                 sub_ov when "0110",
                 'Z' when others;
---Carryout-------------------------------------------------
  With ALUCntl select 
     Carryout<= add_result(32) when "0010",
                sub_result(32) when "0110",
                'Z' when others;
---Set Less Than--------------------------------------------
   Setlessthan: process(A, B) is
   begin
        if A < B then slt<= x"00000001"; else slt<=x"00000000";
        end if;
   end process;
---Set Less Than Unsigned-----------------------------------   
   setlessthanunsigned: process(A, B) is
   begin
        if unsigned(A) < unsigned(B) then sltu<= x"00000001"; else sltu<=x"00000000";
        end if;
   end process;
   

end Behavioral;

