library ieee;
use ieee.std_logic_1164.all;
use  ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY shift_branch Is 
         PORT(  target_2 : in std_logic_vector(7 downto 0);
		target_8 : out std_logic_vector(7 downto 0)) 
END shift_branch;

architecture arch_shift_branch
target_8  <= std_logic_vector ( shift_left(unsigned(target_2 ),1) ); --shift one byte(not_sure)