library IEEE;
use IEEE.std_logic_1164.all;

entity tb_Reg is
	port(
		q,notQ:	out std_logic_vector(31 downto 0)
	);
end tb_Reg;

architecture test of tb_Reg is
	signal c:	std_logic:='0';
	signal d: 	std_logic_vector(31 downto 0):=(others=>'0');
	component Reg
	port(
		clk:	in std_logic;
		D:	in std_logic_vector(31 downto 0);
		Q,NQ:	out std_logic_vector(31 downto 0)
	);
	end component;


begin
	D1: Reg port map(c,d,q,notQ);

	process begin
		wait for 10 ns;
		d <= "00001111010110100100111001101001";
		wait for 10 ns;
		c <= not c;
		wait for 10 ns;
		d <= not d;
		wait for 10 ns;
		c <= not c;
		wait for 10 ns;
		c <= not c;
		wait for 10 ns;
		wait;
	end process;
end test;
		
