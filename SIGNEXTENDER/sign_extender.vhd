library IEEE;
use IEEE.std_logic_1164.all;

entity sign_extender is
	port(
		sixteen:	in std_logic_vector(15 downto 0);
		thirtytwo:	out std_logic_vector(31 downto 0)
	);
end sign_extender;

architecture behavior of sign_extender is
begin
	process(sixteen)
	begin
		thirtytwo(15 downto 0) <= sixteen;
		case (sixteen(15)) is
			when('1')=> thirtytwo(31 downto 16)<=(others=>'1');
			when others=> thirtytwo(31 downto 16)<=(others=>'0');
		end case;
	end process;
end;
