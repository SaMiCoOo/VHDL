library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  
entity control is
  port (
    i:  in std_logic_vector(5 downto 0);
    o:  out std_logic_vector(8 downto 0)
  ) ;
end entity ; -- control

architecture arch of control is
  --Operation Input format.
  constant lw : std_logic_vector(5 downto 0):= "100011";
  constant rformat : std_logic_vector(5 downto 0):= "000000";
  constant sw : std_logic_vector(5 downto 0):= "101011";
  constant beq : std_logic_vector(5 downto 0):= "000100";

begin
  decode : process( i )
  begin
  case( i ) is
  
    when rformat =>
      o<="100100010";
    when lw =>
      o<="011110000";
    when sw =>
      o<="-1-001000";
    when beq =>
      o<="-0-000101";
  
    when others =>
      o<="000000000";
  
  end case ;
    
  end process ; -- decode
end architecture ; -- arch