library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity tb_control is
  port (
  outp: out std_logic_vector(8 downto 0)
  ) ;
end entity ; -- tb_control

architecture arch of tb_control is
  component control is
    port (
      i:  in std_logic_vector(5 downto 0);
      o:  out std_logic_vector(8 downto 0)
    ) ;
  end component ;
  signal inp: std_logic_vector(5 downto 0);
begin
  cu: control port map(inp, outp);

  process
  begin
    wait for 10 ns;
    inp<="000000";
    wait for 10 ns;
    inp<="100011";
    wait for 10 ns;
    inp<="100011";
    wait for 10 ns;
    inp<="101011";
    wait for 10 ns;
    inp<="000100";
    wait for 10 ns;
    inp<="111000";
    wait for 10 ns;
    wait;
  end process;
end architecture ; -- arch