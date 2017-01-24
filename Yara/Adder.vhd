LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY adder IS

port(pc_result: in std_logic_vector(7 downto 0);
	shl_result: in std_logic_vector(7 downto 0);
	alu_result: out std_logic_vector(7 downto 0)	
)
end adder;

architecture arch_adder of adder is
begin 

alu_result <= shl_result+pc_result;

end arch_adder;