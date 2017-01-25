library IEEE;
use IEEE.std_logic_1164.all;

entity tb_alu_control is
end tb_alu_control;

architecture behavior of tb_alu_control is

	component alu_control is
		  port (
			i:  in std_logic_vector(1 downto 0);
			fun:  in  std_logic_vector(5 downto 0);
			o:  out std_logic_vector(3 downto 0)
		  );
	end component;
	signal inp: std_logic_vector(1 downto 0);
	signal funct: std_logic_vector(5 downto 0);
	signal outp: std_logic_vector(3 downto 0);
	
	
begin
	test: alu_control port map(inp,funct,outp);
	process
	begin
		wait for 10 ns;
		inp<= "00";
		wait for 10 ns;
		inp<= "01";
		wait for 10 ns;
		inp<= "10";
		wait for 10 ns;
		funct<= "100000";
		wait for 10 ns;
		funct<= "100010";
		wait for 10 ns;
		funct<= "100100";
		wait for 10 ns;
		funct<= "100101";
		wait for 10 ns;
		funct<= "100111";
		wait for 10 ns;
		inp<= "00";
		wait for 10 ns;
		inp<= "11";
		wait for 10 ns;
		wait;
	end process;

end;
