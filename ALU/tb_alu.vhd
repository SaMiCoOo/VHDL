library IEEE;
use IEEE.std_logic_1164.all;

entity tb_alu is
end tb_alu;

architecture behavior of tb_alu is

	component alu is
		port(
			control: in std_logic_vector(3 downto 0) ;
			dataOne,
			dataTwo: in std_logic_vector(31 downto 0);
			dataOut: out std_logic_vector(31 downto 0);
			Z,
			N: out std_logic
		);
	end component;
	signal A,B,O: std_logic_vector(31 downto 0);
	signal c: std_logic_vector(3 downto 0);
	signal Zero,Neg: std_logic;
begin
	test: alu port map(c,A,B,O,Zero,Neg);
	
	process
	begin
		wait for 10 ns;
		A<="11110000111100001111000000001111";
		B<="11111111000000001111000000001100";
		wait for 10 ns;
		c<="0010";
		wait for 10 ns;
		c<="0110";
		wait for 10 ns;
		c<="1000";
		wait for 10 ns;
		c<="0000";
		wait for 10 ns;
		A<=(others=>'0');
		wait for 10 ns;
		B<=(others=>'1');
		wait for 10 ns;
		c<="0010";
		A<=(others=>'1');
		wait for 10 ns;
		wait;
	end process;
end;
