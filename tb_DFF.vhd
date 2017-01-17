library IEEE;
use IEEE.std_logic_1164.all;

entity tb_DFF is
	port(
		q,notQ:	out std_logic
	);
end tb_DFF;

architecture test of tb_DFF is
	signal c,d: 	std_logic:='0';
	component DFF
	port(
		D:	in std_logic;
		clk:	in std_logic;
		Q,NQ:	out std_logic
	);
	end component;


begin
	D1: DFF port map(d,c,q,notQ);

	process begin
		wait for 10 ns;
		d <= not d;
		wait for 10 ns;
		c <= not c;
		wait for 10 ns;
		d <= not d;
		wait for 10 ns;
		wait;
	end process;
end test;
		
