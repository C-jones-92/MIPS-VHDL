library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity jump_mux is
  Port ( jump_cntl : in std_logic_vector(1 downto 0);
         jump_result, pcadder, rs : in std_logic_vector(31 downto 0);
         mux_out : out std_logic_vector(31 downto 0));
end jump_mux;

architecture Behavioral of jump_mux is

begin
    with jump_cntl select
        mux_out <=  rs when "10",
                    jump_result when "01",
                    pcadder             when "00",
                    x"00000000"         when others;

end Behavioral;
