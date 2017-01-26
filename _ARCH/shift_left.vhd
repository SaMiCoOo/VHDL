library IEEE;
use IEEE.std_logic_1164.all;

entity shift_left is
  port (
    i:  in std_logic_vector(31 downto 0);
    o:  out std_logic_vector(31 downto 0)
  ) ;
end entity ; -- shift_left

architecture behavior of shift_left is


begin
  shift : process( i )
  begin
    o<=i(29 downto 0)&i(31 downto 30);
  end process ; -- shift

end architecture ; -- behavior
