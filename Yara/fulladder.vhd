LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-- n-bit adder
ENTITY assign_full_adder IS
   
PORT(a,b : IN std_logic_vector(7  DOWNTO 0);
             cin : IN std_logic;  
            s : OUT std_logic_vector(7 DOWNTO 0);    
              cout : OUT std_logic);
END assign_full_adder;

ARCHITECTURE arch_assign_full_adder OF assign_full_adder IS
      COMPONENT assign_adder IS
              PORT( a,b,cin : IN std_logic; 
                       s,cout : OUT std_logic);
        END COMPONENT;
SIGNAL temp : std_logic_vector(7 DOWNTO 0);

BEGIN
  f0: assign_adder PORT MAP(a(0),b(0),cin,s(0),temp(0));
  loop1: FOR i IN 1 TO 15 GENERATE
          fx: assign_adder PORT MAP  (a(i),b(i),
                                                 temp(i-1),s(i),temp(i));
    END GENERATE;
    cout <= temp(7);
END arch_assign_full_adder;



