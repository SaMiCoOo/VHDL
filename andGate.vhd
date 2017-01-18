library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity andGate is
  port (
	clk: in std_logic;
	en: in std_logic;
	we: in std_logic;
	o: out std_logic
  ) ;
end entity ; -- andGate

architecture arch of andGate is

begin
	always : process
	begin
		o <= clk and en and we;
	end process ; -- always
end architecture ; -- arch