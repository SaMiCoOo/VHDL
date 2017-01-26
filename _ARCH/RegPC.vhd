library IEEE;
use IEEE.std_logic_1164.all;

entity RegPC is
	port(
		clk:	in std_logic;
		D:	in std_logic_vector(31 downto 0);
		Q:	out std_logic_vector(31 downto 0)
	);
end RegPC;

architecture behavior of RegPC is
	component DFFPC
	port(
		clk:	in std_logic;
		D:	in std_logic;
		Q:	out std_logic
	);
	end component;
begin

	X: for i in 0 to 31 generate
		DFFX: DFFPC port map(clk,D(i),Q(i));
	end generate X;
end behavior;
