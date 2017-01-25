library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity alu_control is
  port (
    i:  in std_logic_vector(1 downto 0);
    fun:  in  std_logic_vector(5 downto 0);
    o:  out std_logic_vector(3 downto 0)
  ) ;
end alu_control ; -- alu_control

architecture arch of alu_control is
constant storeOrload : std_logic_vector(1 downto 0):="00";
constant branch : std_logic_vector(1 downto 0):="01";
constant branchNegative : std_logic_vector(1 downto 0):="11";
constant rformat : std_logic_vector(1 downto 0):="10";
begin
  alu_control : process( i,fun )
  begin
    case( i ) is
    
      when storeOrload =>
        o<="0010";
      when branch =>
        o<="0110";
      when branchNegative =>
        o<="0110";
      when rformat =>
        case( fun ) is
        
          when "100000" =>
            o<="0010"; -- add
          when "100010" =>
            o<="0110"; -- sub
          when "100100" =>
            o<="0000"; -- nand
          when "100101" =>
            o<="0001"; -- rlc
          when "100111" =>
            o<="1000"; -- rrc
          
        
          when others =>
            o<="1111";
        
        end case ;
    
      when others =>
    
    end case ;
    
  end process ; -- alu_control

end architecture ; -- arch
