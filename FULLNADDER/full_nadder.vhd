library IEEE;
use IEEE.std_logic_1164.all;

entity full_nadder is
	generic(n: integer:= 32);
	port(
		X,Y:	in std_logic_vector(n-1 downto 0);
		Sub:	in std_logic;
		Cout: out std_logic;
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
	component xor_gate
	port(
		a,b:	in std_logic;
		o:	out std_logic
	);
	end component;
	signal temp : std_logic_vector(n-1 downto 0);
	signal Carries : std_logic_vector(n-1 downto 0);
begin

 	xor_gatesGeneator: for i in 0 to n-1 generate
		XORX: xor_gate port map(Y(i),Sub,temp(i));
	end generate;

	leastSignificant: full_adder port map (Sub,X(0),temp(0),O(0),Carries(0));

	AddersGenerator: for i in 1 to n-2 generate
		AdderX: full_adder port map (Carries(i-1),X(i),temp(i),O(i),Carries(i));
	end generate;
	
	MostSignificant: full_adder port map (Carries(n-2),X(n-1),temp(n-1),O(n-1),Cout);

	
end behavior;
