-------------------------------------------------------------------------
--
-- Sumador Completo de 1 bit
--
-------------------------------------------------------------------------

library IEEE;
USE IEEE.STd_logic_1164.ALL;

entity sumador_completo_1bit is
	
	port ( A : in std_logic;
			 B : in std_logic;
			 I : in std_logic;
			 S : out std_logic;
			 C : out std_logic
			);
	
end sumador_completo_1bit;

architecture behavioral of sumador_completo_1bit is

begin

	S <= (A xor B) xor I;
	C <= (A and B) or ((A xor B) and I);

end behavioral;
