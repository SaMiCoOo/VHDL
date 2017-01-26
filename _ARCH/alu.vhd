library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity alu is
  port (
	control: in std_logic_vector(3 downto 0) ;
	dataOne,
	dataTwo: in std_logic_vector(31 downto 0);
	dataOut: out std_logic_vector(31 downto 0);
	Z,
	N: out std_logic
  ) ;
end entity ; -- alu

architecture arch of alu is
	component full_nadder is
	generic(n: integer);
	port(
		X,Y:	in std_logic_vector(n-1 downto 0);
		Sub:	in std_logic;
		Cout:	out std_logic;
		O:	out std_logic_vector(n-1 downto 0)
	);
	end component;
	component mux is
		port(
			s:	in std_logic;
			a,b:	in std_logic_vector(31 downto 0);
			f:	out std_logic_vector(31 downto 0)
		);
	end component;

	Signal adderOut: std_logic_vector(31 downto 0);
	Signal carryOut: std_logic;

	constant Zero : std_logic_vector(31 downto 0):= (others=>'0');
	Signal aluOut : std_logic_vector(31 downto 0);
	Signal smux: std_logic:='0';
begin
	adder: full_nadder generic map(32) port map (dataOne, dataTwo, control(2), carryOut , adderOut);
	m: mux port map(smux,aluOut,adderOut,dataOut);
	
	process( control,dataOne,dataTwo )
	variable temp : std_logic_vector(31 downto 0);
	begin
		case( control ) is
			when "0010" =>
				smux <= '1';
				temp:= adderOut;
			when "0110" =>
				smux <= '1';
				temp:= adderOut;
			when "0001" =>
				smux <= '0';
				temp:= dataOne(30 downto 0)&dataOne(31);
				aluOut <= dataOne(30 downto 0)&dataOne(31);
			when "1000" =>
				smux <= '0';
				temp:= dataOne(0)&dataOne(31 downto 1);
				aluOut <= dataOne(0)&dataOne(31 downto 1);
			when "0000" =>
				smux <= '0';
				temp:= dataOne nand dataTwo; 
				aluOut <= dataOne nand dataTwo; 
		
			when others =>
				smux<='0';
				temp := Zero;
				aluOut <= Zero;
		
		end case ;

		if temp = Zero then
			Z<='1';
			N<='0';
		elsif temp(31) = '1' then
			Z<='0';
			N<='1';
		else
			Z<='0';
			N<='0';
		end if ;
	end process ; 

end architecture ; -- arch
