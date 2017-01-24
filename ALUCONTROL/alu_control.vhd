library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity alu_control is
  port (
    i:  in std_logic_vector(1 downto 0);
    fun:  in  std_logic_vector(5 downto 0);
    o:  out std_logic_vector(3 downto 0)
  ) ;
end entity ; -- alu_control
constant storeOrload = "00";
constant branch= "01";
constant rformat= "10";
architecture arch of alu_control is
  alu_control : process( i )
  begin
    case( i ) is
    
      when storeOrload =>
        o<=
    
      when others =>
    
    end case ;
    
  end process ; -- alu_control
begin

end architecture ; -- arch