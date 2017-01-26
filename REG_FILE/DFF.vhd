library IEEE;
use IEEE.std_logic_1164.all;

entity DFF is
	port(
		D:	in std_logic;
		clk:	in std_logic;
		Q:	out std_logic
	);
end DFF;

architecture behavior of DFF is
begin
	process(clk)
	begin
		if(clk'event and clk='1') then
			Q <= D;
		end if;
	end process;
end behavior;
