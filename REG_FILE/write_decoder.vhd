library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity write_decoder is
	port(
		i:	in std_logic_vector(4 downto 0);
		o:	out std_logic_vector(31 downto 0)
	);
end write_decoder;

architecture behavior of write_decoder is
begin
 	process(i)
	begin
		o<=(others=>'0');
		o(to_integer(unsigned(i)))<='1';
		
	end process ;
	



end;
