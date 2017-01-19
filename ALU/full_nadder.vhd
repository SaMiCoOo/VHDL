library IEEE;
use IEEE.std_logic_1164.all;

entity full_nadder is
	generic(n: integer:= 32);
	port(
		X,Y:	in std_logic_vector(n-1 downto 0);
		Sub:	in std_logic;
		Cout,Over:	out std_logic;
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
	signal Carries : std_logic_vector(n-1 downto 0);
	signal temp : std_logic_vector(n-1 downto 0);
begin

       	xor_gatesGeneator: for i in 0 to n-1 generate
		XORX: xor_gate port map(Y(i),Sub,temp(i));
	end generate;

	leastSignificant: full_adder port map (Sub,X(0),temp(0),O(0),Carries(0));

	AddersGenerator: for i in 1 to n-1 generate
		AdderX: full_adder port map (Carries(i-1),X(i),temp(i),Carries(i));
	end generate;
	Cout <= Carries(n-1);
	Over <= Carries(n-1) xor Carries(n-2);
end behavior;
