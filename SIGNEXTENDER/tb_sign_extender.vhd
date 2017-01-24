library IEEE;
use IEEE.std_logic_1164.all;

entity tb_sign_extender is
	port(
		o: 	out std_logic_vector(31 downto 0)
	);
end tb_sign_extender;

architecture behavior of tb_sign_extender is

	component sign_extender is
		port(
			sixteen:	in std_logic_vector(15 downto 0);
			thirtytwo:	out std_logic_vector(31 downto 0)
		);
	end component;
	signal i: std_logic_vector(15 downto 0):=(others=>'0');
	
begin
	se: sign_extender port map ( i,o );

	process
	begin
		i <="0000111100001111";
		wait for 10 ns;
		i <="1111000011110000";
		wait for 10 ns;
		i <="1010101010101101";
		wait for 10 ns;
		i <="0101010101010101";
		wait for 10 ns;
		wait;
	end process;

end;
