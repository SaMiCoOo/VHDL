library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux is
end tb_mux;

architecture behavior of tb_mux is

	component mux is
		port(
			s:	in std_logic;
			a,b:	in std_logic_vector(31 downto 0);
			f:	out std_logic_vector(31 downto 0)
		);
	end component;
	signal i1,i2,outed:	std_logic_vector(31 downto 0);
	signal selected: std_logic;
	
begin
	m: mux port map(selected,i1,i2,outed);

	process
	begin
		wait for 10 ns;
		i1<="11110000111111110000111100001111";
		i2<="11001100110101010101010101010010";
		wait for 10 ns;
		selected <= '0';
		wait for 10 ns;
		selected <= '1';
		wait for 10 ns;
		wait;
	end process;

end;
