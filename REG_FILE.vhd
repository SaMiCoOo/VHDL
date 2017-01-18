library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity REG_FILE is
  port (
	clk,RegWrite:	in std_logic;
	ReadRegister1,
	ReadRegister2,
	WriteRegister:	in std_logic_vector(3 downto 0);
	WriteData:		in std_logic_vector(31 downto 0);
	ReadData1,
	ReadData2:		out std_logic_vector(31 downto 0)
  ) ;
end entity ; -- REG_FILE

architecture behavior of REG_FILE is
	
	component write_decoder
		port(
			i:	in std_logic_vector(3 downto 0);
			o0,o1,o2,o3,
			o4,o5,o6,o7,
			o8,o9,o10,o11,
			o12,o13,o14,o15:	out std_logic
		);
	end component;

	component read_mux
	port(
		s:	in std_logic_vector(3 downto 0);
		o:	out std_logic_vector(31 downto 0);
		i0,i1,i2,i3,i4,i5,i6,i7,
		i8,i9,i10,i11,i12,i13,i14,i15:	in std_logic_vector(31 downto 0)
	);
	end component;

	component Reg
	port(
		clk:	in std_logic;
		D:	in std_logic_vector(31 downto 0);
		Q:	out std_logic_vector(31 downto 0)
	);
	end component;

	component andGate
	port(
		clk: in std_logic;
		en: in std_logic;
		we: in std_logic;
		o: out std_logic
	);
	end component;

	signal e: std_logic_vector(15 downto 0);
	signal c: std_logic_vector(15 downto 0);
	signal 
		R15,R14,R13,R12,
		R11,R10,R9,R8,
		R7,R6,R5,R4,
		R3,R2,R1,R0 :	std_logic_vector(31 downto 0);


begin
	AndGates : for i in 15 to 0 generate
		AndX: andGate port map(clk,e(i),RegWrite,c(i));
	end generate ; -- AndGates

	REG0: Reg port map(c(0),WriteData,R0);
	REG1: Reg port map(c(1),WriteData,R1);
	REG2: Reg port map(c(2),WriteData,R2);
	REG3: Reg port map(c(3),WriteData,R3);
	REG4: Reg port map(c(4),WriteData,R4);
	REG5: Reg port map(c(5),WriteData,R5);
	REG6: Reg port map(c(6),WriteData,R6);
	REG7: Reg port map(c(7),WriteData,R7);
	REG8: Reg port map(c(8),WriteData,R8);
	REG9: Reg port map(c(9),WriteData,R9);
	REG10: Reg port map(c(10),WriteData,R10);
	REG11: Reg port map(c(11),WriteData,R11);
	REG12: Reg port map(c(12),WriteData,R12);
	REG13: Reg port map(c(13),WriteData,R13);
	REG14: Reg port map(c(14),WriteData,R14);
	REG15: Reg port map(c(15),WriteData,R15);

	WriteDecoder: write_decoder port map(
		WriteRegister,
		e(15),e(14),e(13),e(12),
		e(11),e(10),e(9),e(8),
		e(7),e(6),e(5),e(4),
		e(3),e(2),e(1),e(0)
		);
	ReadMultiplexer1: read_mux port map(
		ReadRegister1,
		ReadData1,
		R15,R14,R13,R12,
		R11,R10,R9,R8,
		R7,R6,R5,R4,
		R3,R2,R1,R0
		);
	ReadMultiplexer2: read_mux port map(
		ReadRegister2,
		ReadData2,
		R15,R14,R13,R12,
		R11,R10,R9,R8,
		R7,R6,R5,R4,
		R3,R2,R1,R0
		);


end architecture ; -- behavior