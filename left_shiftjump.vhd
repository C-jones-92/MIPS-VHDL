library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity left_shiftjump is
  Port ( data_in : in std_logic_vector(31 downto 0);
         data_in2 : in std_logic_vector(31 downto 0);
         data_out : out std_logic_vector(31 downto 0));
end left_shiftjump;

architecture Behavioral of left_shiftjump is

begin
    data_out <= data_in2(31 downto 28) & (data_in(27 downto 2) & "00");
end Behavioral;
