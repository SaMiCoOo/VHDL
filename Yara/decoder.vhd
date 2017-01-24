
library IEEE;
USE IEEE.std_logic_1164.all;

entity decoder is 
port ( s : IN std_logic_vector(3 downto 0); e : in std_logic; output: out std_logic_vector(7 downto 0) ); 
end decoder;


ARCHITECTURE Behavioral OF decoder IS
BEGIN

PROCESS (s,e) BEGIN
if e= '1' then

case s is
when "0000" => output <="000-0000"; -- no operation
when "0001" => output <="00011010"; --load
when "0010" => output <="000-0100";--store -- x is the don't care
when "0011" => output <="00001000"; --load immedia
when "0100" => output <="00101000"; -- add
when "0101" => output <="01001000"; --sub
when "0110" => output <="01101000"; --nand
when "0111" => output <="10001000"; --RLC
when "1000" => output <="10100000"; --RRC
when "1001" => output <="000-0001"; --BR


when others => output <="000-0000"; -- do what ???
end case;

else
output<="000-0000";

end if;
end process;

end Behavioral;