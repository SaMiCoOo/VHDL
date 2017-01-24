
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY 	branch IS
port(	Clk : in std_logic; 
	pc_adder_result: in std_logic_vector(7 downto 0);
	target_extended: in std_logic_vector(7 downto 0);
	flag_branch: in std_logic;
	flag_zero: in std_logic;
	next_pc: out std_logic_vector(7 downto 0) );

end branch;

architecture arch_branch of branch is

component mux is
port ( s : IN std_logic; a : IN std_logic_vector(7 downto 0); b : IN std_logic_vector(7 downto 0);
f :  out std_logic_vector(7 downto 0) ); 
end component;

component assign_full_adder IS
   
PORT(a,b : IN std_logic_vector(7  DOWNTO 0);
             cin : IN std_logic;  
            s : OUT std_logic_vector(7 DOWNTO 0);    
              cout : OUT std_logic);
END component;

signal mux_branch_s: std_logic; 
signal cout: std_logic; 
signal branch_adder_result: std_logic_vector( 7 downto 0 ); 

begin

mux_branch_s <= flag_zero and flag_branch ;

branch_adder : assign_full_adder port map(pc_adder_result,target_extended,'0',branch_adder_result,cout);
mux_branch : mux port map(mux_branch_s,pc_adder_result,branch_adder_result);

end arch_branch;