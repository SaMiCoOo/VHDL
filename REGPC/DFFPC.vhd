library IEEE;
use IEEE.std_logic_1164.all;

entity DFFPC is
	port(
		D:	in std_logic;
		clk:	in std_logic;
		Q:	out std_logic
	);
end DFFPC;

architecture behavior of DFFPC is
begin
	process(clk)
	begin
		if(clk'event and clk='0') then
  	  		if (D = 'U') or (D = 'X') then
  	  			Q <= '0';
  	  		else
				Q <= D;
			end if;
		end if;
	end process;
end behavior;
