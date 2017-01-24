
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY 	encode IS
port(	Clk : in std_logic; 
	inst: in std_logic_vector(7 downto 0);
	control_vector: out std_logic_vector(7 downto 0) );
end encode;

architecture arch_encode of encode is

component n_reg is
PORT( Clk,Rst,en : IN std_logic;
		   d : IN std_logic_vector(7 DOWNTO 0);
		   q : OUT std_logic_vector(7 DOWNTO 0));
end component;

component decoder is 
port (	s : IN std_logic_vector(3 downto 0);
 	e : in std_logic;
	output: out std_logic_vector(7 downto 0)); 
end component;

signal inst_decoded : std_logic_vector( 7 downto 0 ); 

begin 

inst_memory : n_reg port map(Clk,'0','1',inst, inst_decoded);
control : decoder port map(inst_decoded(7 downto 4),'1',control_vector);

end arch_encode;