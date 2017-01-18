library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;

entity sync_ram is
  port (
    clock   : in  std_logic;
    MemWrite      : in  std_logic;
    Address : in  std_logic_vector(31 downto 0);
    ReadData  : in  std_logic_vector(31 downto 0);
    WriteData : out std_logic_vector
  );
end entity sync_ram;

architecture RTL of sync_ram is

   type ram_type is array (0 to 31) of std_logic_vector(31 downto 0);
   signal ram : ram_type;
   signal latched_address : std_logic_vector(31 downto 0);

begin

  RamProc: process(clock) is

  begin
    if rising_edge(clock) then
      if MemWrite = '1' then
        ram(to_integer(unsigned(Address))) <= ReadData;
      end if;
      latched_address <= Address;
    end if;
  end process RamProc;

  WriteData <= ram(to_integer(unsigned(latched_address)));

end architecture RTL;