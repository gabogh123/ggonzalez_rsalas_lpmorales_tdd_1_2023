-------------------------------------------------------------------------
--
-- Ejercicio 2
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.STd_logic_1164.all;

entity sumador_completo_4bits_to_sseg is

	port ( A : in std_logic_vector (3 downto 0);
			 B : in std_logic_vector (3 downto 0);
			 I : in std_logic;
			 S_sseg : out std_logic_vector (6 downto 0);
			 C_sseg : out std_logic_vector (6 downto 0)
			);
	
end sumador_completo_4bits_to_sseg;

architecture behavioral of sumador_completo_4bits_to_sseg is

	-- Declaracion de sumador_completo_4bits
	component sumador_completo_4bits is
	port ( Av : in std_logic_vector (3 downto 0);
			 Bv : in std_logic_vector (3 downto 0);
			 Cin : in std_logic;
			 Sv : out std_logic_vector (3 downto 0);
			 Cout : out std_logic
			);
	end component;
	
	-- Declaracion de hex_to_sseg
	component hex_to_sseg is
	port(
			hex : in std_logic_vector (3 downto 0);
			sseg : out std_logic_vector (6 downto 0)
		  ); 
	end component;
	
	-- Declaracion de signal para obtener el vector de Suma (Sv)
	signal sig_suma : std_logic_vector (3 downto 0) := "0000";
	
	-- Declaracion de signal para obtener el Carry (Cout)
	signal sig_carry : std_logic_vector (3 downto 0) := "0000";
	
	
begin

	-- Instanciamiento del sumador de 4 bits
	sumador_completo_4bits_1 : sumador_completo_4bits 
	port map (			
					Av => A,
					Bv => B,
					Cin => I,
					Sv => sig_suma,
					Cout => sig_carry(0)		
				);
				
	-- Instanciamiento del hex_to_sseg para el resultado de S
	suma_hex_to_sseg : hex_to_sseg
	port map (
					hex => sig_suma,
					sseg => S_sseg
				); 
				
	-- Instanciamiento del hex_to_sseg para el resultado de S
	carry_hex_to_sseg : hex_to_sseg
	port map (
					hex => sig_carry,
					sseg => C_sseg
				);
				
end behavioral;