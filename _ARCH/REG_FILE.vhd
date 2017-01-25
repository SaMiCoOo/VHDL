library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity REG_FILE is
  port (
	clk,RegWrite:	in std_logic;
	ReadRegister1,
	ReadRegister2,
	WriteRegister:	in std_logic_vector(4 downto 0);
	WriteData:		in std_logic_vector(31 downto 0);
	ReadData1,
	ReadData2:		out std_logic_vector(31 downto 0)
  ) ;
end entity ; -- REG_FILE

architecture behavior of REG_FILE is
	
	component write_decoder
		port(
			i:	in std_logic_vector(4 downto 0);
			o:	out std_logic_vector(31 downto 0)
		);
	end component;

	component read_mux
	port(
		s:	in std_logic_vector(4 downto 0);
		o:	out std_logic_vector(31 downto 0);
		i0,i1,i2,i3,i4,i5,i6,i7,
		i8,i9,i10,i11,i12,i13,i14,i15,
		i16,i17,i18,i19,i20,i21,i22,i23,
		i24,i25,i26,i27,i28,i29,i30,i31:	in std_logic_vector(31 downto 0)
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

	signal e: std_logic_vector(31 downto 0);
	signal c: std_logic_vector(31 downto 0);
	type registers is array (0 to 31) of std_logic_vector(31 downto 0) ;
	signal R: registers;


begin
	andOfZero: andGate port map(clk,'1','1',c(0));
	AndGatesGenerator : for i in 1 to 31 generate
		AndX: andGate port map(clk,e(i),RegWrite,c(i));
	end generate ; -- AndGatesGenerator
	ZeroRegister: Reg port map(c(0),(others=>'0'),R(0));
	RegistersGenerator : for i in 1 to 31 generate
		RegX: Reg port map(c(i),WriteData,R(i));
	end generate ; -- RegistersGenerator

	WriteDecoder_0_15: write_decoder port map(WriteRegister,e);

	ReadMultiplexer1: read_mux port map(
		ReadRegister1,
		ReadData1,
		R(0),R(1),R(2),R(3),R(4),R(5),R(6),R(7),
		R(8),R(9),R(10),R(11),R(12),R(13),R(14),R(15),
		R(16),R(17),R(18),R(19),R(20),R(21),R(22),R(23),
		R(24),R(25),R(26),R(27),R(28),R(29),R(30),R(31)
		);
	ReadMultiplexer2: read_mux port map(
		ReadRegister1,
		ReadData1,
		R(0),R(1),R(2),R(3),R(4),R(5),R(6),R(7),
		R(8),R(9),R(10),R(11),R(12),R(13),R(14),R(15),
		R(16),R(17),R(18),R(19),R(20),R(21),R(22),R(23),
		R(24),R(25),R(26),R(27),R(28),R(29),R(30),R(31)
		);


end architecture ; -- behavior