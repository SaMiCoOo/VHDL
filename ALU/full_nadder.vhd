library IEEE;
use IEEE.std_logic_1164.all;

entity full_nadder is
	generic(n: integer:= 32);
	port(
		X,Y:	in std_logic_vector(n-1 downto 0);
		Cin:	in std_logic;
		Cout:	out std_logic;
		O:	out std_logic_vector(n-1 downto 0)
	);
end full_nadder;

architecture behavior of full_nadder is
	component full_adder
	port (
		Cin,X,Y:	in std_logic;
		O,Cout:		out std_logic
	) ;
	end component;
	signal Carries : std_logic_vector(n-1 downto 0);
begin
	leastSignificant: full_adder port map (Cin,X(0),Y(0),O(0),Carries(0));

	AddersGenerator: for i in 1 to n-1 generate
		AdderX: full_adder port map (Carries(i-1),X(i),Y(i),Carries(i));
	end generate;
	Cout <= Carries(n-1);
end behavior;
