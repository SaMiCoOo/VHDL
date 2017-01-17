library IEEE;
use IEEE.std_logic_1164.all;

entity tb_write_decoder is
end tb_write_decoder;

architecture behavior of tb_write_decoder is

	component write_decoder
		port(
			i:	in std_logic_vector(3 downto 0);
			o0,o1,o2,o3,
			o4,o5,o6,o7,
			o8,o9,o10,o11,
			o12,o13,o14,o15:	out std_logic
		);
	end component;

	signal inpu: std_logic_vector(3 downto 0):="0000";
	signal 	o0,o1,o2,o3,
		o4,o5,o6,o7,
		o8,o9,o10,o11,
		o12,o13,o14,o15: std_logic;
begin
	dddd: write_decoder port map(inpu,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15);

	process
	begin
		wait for 10 ns;
		inpu <= "0001";
		wait for 10 ns;
		inpu <= "0010";
		wait for 10 ns;
		inpu <= "0011";
		wait for 10 ns;
		inpu <= "0100";
		wait for 10 ns;
		inpu <= "0101";
		wait for 10 ns;
		inpu <= "0110";
		wait for 10 ns;
		inpu <= "0111";
		wait for 10 ns;
		inpu <= "1000";
		wait for 10 ns;
		inpu <= "1001";
		wait for 10 ns;
		inpu <= "1010";
		wait for 10 ns;
		inpu <= "1011";
		wait for 10 ns;
		inpu <= "1100";
		wait for 10 ns;
		inpu <= "1101";
		wait for 10 ns;
		inpu <= "1110";
		wait for 10 ns;
		inpu <= "1111";
		wait for 10 ns;
		wait;
	end process ;

end;
