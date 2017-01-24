library IEEE;
use IEEE.std_logic_1164.all;

entity tbe_shift_left is
end tbe_shift_left;

architecture behavior of tbe_shift_left is

	component shift_left is
		port(
			i:	in std_logic_vector(31 downto 0);
			o:	out std_logic_vector(31 downto 0)	
		);
	end component;
	signal inp,outp:	std_logic_vector(31 downto 0);
	
begin
	sl: shift_left port map(inp,outp);
	
	process
	begin
		wait for 10 ns;
		inp<="00000000000000001100111100001111";
		wait for 10 ns;
		inp<="00000000000000001111111111111111";
		wait for 10 ns;
		wait;
	end process;
end;
