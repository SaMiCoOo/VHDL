LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-- single bit adder
ENTITY assign_adder Is 
         PORT( a,b,cin : IN std_logic;
                   s,cout : OUT std_logic); 
END assign_adder;

ARCHITECTURE arch_assign_adder OF assign_adder IS
BEGIN
     PROCESS (a,b,cin)
    BEGIN
              s <= a XOR b XOR cin;
              cout <= (a AND b) or (cin AND (a XOR b));
     END PROCESS;
END arch_assign_adder;

