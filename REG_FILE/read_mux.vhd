library IEEE;
use IEEE.std_logic_1164.all;

entity read_mux is
	port(
		s:	in std_logic_vector(3 downto 0);
		o:	out std_logic_vector(31 downto 0);
		i0,i1,i2,i3,i4,i5,i6,i7,
		i8,i9,i10,i11,i12,i13,i14,i15:	in std_logic_vector(31 downto 0)
	);
end read_mux;

architecture behavior of read_mux is
begin
	o <= i0 when s = "0000" else 
	     i1 when s = "0001" else 
	     i2 when s = "0010" else 
	     i3 when s = "0011" else
	     i4 when s = "0100" else
	     i5 when s = "0101" else
	     i6 when s = "0110" else
	     i7 when s = "0111" else
	     i8 when s = "1000" else
	     i9 when s = "1001" else
	     i10 when s = "1010" else
	     i11 when s = "1011" else
	     i12 when s = "1100" else
	     i13 when s = "1101" else
	     i14 when s = "1110" else
	     i15 when s = "1111";
	
end behavior;
