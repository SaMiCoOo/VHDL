library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity sync_ram is
  port (
    clock:		in  std_logic;
    MemWrite:   in  std_logic;
    Address:	in  std_logic_vector(31 downto 0);
    WriteData:	in  std_logic_vector(31 downto 0);
    ReadData:	out std_logic_vector(31 downto 0)
  );
end entity sync_ram;

architecture RTL of sync_ram is

   type ram_type is array (0 to 1023) of std_logic_vector(31 downto 0);
   signal ram : ram_type;

begin

  RamProc: process(clock) is

  begin
    if rising_edge(clock) then
      if MemWrite = '1' then
        ram(to_integer(unsigned(Address))) <= WriteData;
      end if;
    end if;
    if to_integer(unsigned(Address)) < 1024 then
      ReadData <= ram(to_integer(unsigned(Address)));
      else
      ReadData <= (others=>'0');
    end if ;
  end process RamProc;
  

end architecture RTL;