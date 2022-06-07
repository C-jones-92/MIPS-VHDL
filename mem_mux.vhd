----------------------------------------------------------------------------------
-- Company: George Mason University - ECE 445 - Computer Organization
-- Engineer: Jordan Carnes
-- Create Date: 07/03/2020
-- Module Name: Data Memory Multiplexor
-- Project Name: Lab 4 - I-type Datapath
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity mem_mux is
  Port ( read_data, alu_out, pc : in std_logic_vector(31 downto 0);
         memtoreg : in std_logic_vector(1 downto 0);
         mux_out : out std_logic_vector(31 downto 0));
end mem_mux;

architecture Behavioral of mem_mux is

begin
    with memtoreg select
        mux_out <=  pc          when "10",
                    read_data   when "01",
                    alu_out     when "00",
                    x"00000000" when others;
end Behavioral;
