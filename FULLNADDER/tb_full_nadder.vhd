library IEEE;
use IEEE.std_logic_1164.all;

entity tb_full_nadder is
end tb_full_nadder;

architecture behavior of tb_full_nadder is

  component full_nadder is
    generic(n: integer);
    port(
      X,Y:  in std_logic_vector(n-1 downto 0);
      Sub:  in std_logic;
      Cout: out std_logic;
      O:  out std_logic_vector(n-1 downto 0)
    );
  end component;
  signal A,B,O: std_logic_vector(31 downto 0);
  signal Cout,sub: std_logic;
begin
  test: full_nadder generic map(32) port map(A,B,sub,Cout,O);
  
  process
  begin
    wait for 10 ns;
    A<="11110000111100001111000000001111";
    B<="11111111000000001111000000001100";
    wait for 10 ns;
    sub<='0';
    wait for 10 ns;
    sub<='1';
    wait for 10 ns;
    A<=(others=>'0');
    wait for 10 ns;
    B<=(others=>'1');
    wait for 10 ns;
    sub<='0';
    A<=(others=>'1');
    wait for 10 ns;
    wait;
  end process;
end;
