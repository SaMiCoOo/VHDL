library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity full_adder is
  port (
	Cin,X,Y:	in std_logic;
	O,Cout:		out std_logic
  ) ;
end entity ; -- full_adder

architecture behavior of full_adder is

begin
	O <= X xor Y xor Cin;
	Cout <= (X and Y) or (Cin and X) or (Cin and Y) ;
end architecture ; -- behavior
