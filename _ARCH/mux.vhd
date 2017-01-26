LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux IS
port ( 
  s:	IN std_logic; 
  a,b: 	IN std_logic_vector(31 downto 0); 
  f:  	out std_logic_vector(31 downto 0)
  ); 
end mux;

architecture arch_mux of mux is
begin

process(a,b,s)
begin

  case( s ) is
  
    when '0' =>
      f<= a;
    when '1' =>
      f<= b;
  
    when others => f<=(others=>'U');
  
  end case ;

end process;
end arch_mux;
