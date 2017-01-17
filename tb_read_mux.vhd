library IEEE;
use IEEE.std_logic_1164.all;

entity tb_read_mux is
end tb_read_mux;

architecture behavior of tb_read_mux is
	component read_mux
	port(
		s:	in std_logic_vector(3 downto 0);
		o:	out std_logic_vector(31 downto 0);
		i0,i1,i2,i3,i4,i5,i6,i7,
		i8,i9,i10,i11,i12,i13,i14,i15:	in std_logic_vector(31 downto 0)
	);
	end component;
	signal s: std_logic_vector(3 downto 0):= "0000";
	signal de: std_logic_vector(31 downto 0):= (others=>'0');
	signal i0,i1,i2,i3,i4,i5,i6,i7,
		i8,i9,i10,i11,i12,i13,i14,i15:	std_logic_vector(31 downto 0);
begin
	i0 <= "00001111000011110000111100001111";
	i1 <= "00000000000000000000000000000000";
	i7 <= "00111111001111110011111100111111";
	i15 <= "11110000111100001111000011110000";
	co: read_mux port map(s,de,i0,i1,i2,i3,i4,i5,i6,i7,
		i8,i9,i10,i11,i12,i13,i14,i15);
	
	process
	begin
		wait for 10 ns;
		s(0)<= not s(0);
		wait for 10 ns;
		s(1)<= not s(1);
		wait for 10 ns;
		s(2)<= not s(2);
		wait for 10 ns;
		s(3)<= not s(3);
		wait for 10 ns;
		wait;
	end process;
end;
