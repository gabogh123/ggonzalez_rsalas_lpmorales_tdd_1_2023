-------------------------------------------------------------------------
--
-- Sumador Completo de 4 bits
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.STd_logic_1164.all;

entity sumador_completo_4bits is

	port ( Av : in std_logic_vector (3 downto 0);
			 Bv : in std_logic_vector (3 downto 0);
			 Cin : in std_logic;
			 Sv : out std_logic_vector (3 downto 0);
			 Cout : out std_logic
			);
	
end sumador_completo_4bits;

architecture behavioral of sumador_completo_4bits is

	-- Declaracion de componente
	component sumador_completo_1bit is
	port ( A : in std_logic;
			 B : in std_logic;
			 I : in std_logic;
			 S : out std_logic;
			 C : out std_logic
			);
	end component;
	
	-- Declaracion de signal para obtener el Carry (C)
	signal sig_carry : std_logic_vector (2 downto 0) := "000";

begin

	-- Instanciamiento de los sumadores de 1 bit
	
	sumador_completo_1bit_1 : sumador_completo_1bit 
	port map (			
					A => Av(0),
					B => Bv(0),
					I => Cin,
					S => Sv(0),
					C => sig_carry(0)			
				);
				
	sumador_completo_1bit_2 : sumador_completo_1bit 
	port map (			
					A => Av(1),
					B => Bv(1),
					I => sig_carry(0),
					S => Sv(1),
					C => sig_carry(1)
				);
				
	sumador_completo_1bit_3 : sumador_completo_1bit 
	port map (			
					A => Av(2),
					B => Bv(2),
					I => sig_carry(1),
					S => Sv(2),
					C => sig_carry(2)			
				);
				
	sumador_completo_1bit_4 : sumador_completo_1bit 
	port map (			
					A => Av(3),
					B => Bv(3),
					I => sig_carry(2),
					S => Sv(3),
					C => Cout	
				);

end behavioral;
			