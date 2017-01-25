LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY mux_regDst IS
port ( 
  s:  IN std_logic; 
  a,b:  IN std_logic_vector(4 downto 0); 
  f:    out std_logic_vector(4 downto 0)
  ); 
end mux_regDst;

architecture arch_mux of mux_regDst is
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
