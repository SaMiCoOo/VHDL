library IEEE;
use IEEE.std_logic_1164.all;

entity read_mux is
	port(
		s:	in std_logic_vector(4 downto 0);
		o:	out std_logic_vector(31 downto 0);
		i0,i1,i2,i3,i4,i5,i6,i7,
		i8,i9,i10,i11,i12,i13,i14,i15,
		i16,i17,i18,i19,i20,i21,i22,i23,
		i24,i25,i26,i27,i28,i29,i30,i31:	in std_logic_vector(31 downto 0)
	);
end read_mux;

architecture behavior of read_mux is
begin
	o <= i0 when s = "00000" else 
	     i1 when s = "00001" else 
	     i2 when s = "00010" else 
	     i3 when s = "00011" else
	     i4 when s = "00100" else
	     i5 when s = "00101" else
	     i6 when s = "00110" else
	     i7 when s = "00111" else
	     i8 when s = "01000" else
	     i9 when s = "01001" else
	     i10 when s = "01010" else
	     i11 when s = "01011" else
	     i12 when s = "01100" else
	     i13 when s = "01101" else
	     i14 when s = "01110" else
	     i15 when s = "01111" else
	     i16 when s = "10000" else 
	     i17 when s = "10001" else 
	     i18 when s = "10010" else 
	     i19 when s = "10011" else
	     i20 when s = "10100" else
	     i21 when s = "10101" else
	     i22 when s = "10110" else
	     i23 when s = "10111" else
	     i24 when s = "11000" else
	     i25 when s = "11001" else
	     i26 when s = "11010" else
	     i27 when s = "11011" else
	     i28 when s = "11100" else
	     i29 when s = "11101" else
	     i30 when s = "11110" else
	     i31 when s = "11111";
	
end behavior;
