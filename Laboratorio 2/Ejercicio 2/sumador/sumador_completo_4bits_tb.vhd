-------------------------------------------------------------------------
--
-- Test Bench para el Sumador Completo de 4 bits
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.STd_logic_1164.all;

entity sumador_completo_4bits_tb is
end sumador_completo_4bits_tb;

architecture behavior of sumador_completo_4bits_tb is

	-- Declaracion de componentes
	component sumador_completo_4bits

		port ( Av : in std_logic_vector (3 downto 0);
				 Bv : in std_logic_vector (3 downto 0);
				 Cin : in std_logic;
				 Sv : out std_logic_vector (3 downto 0);
				 Cout : out std_logic
				);
		
	end component;
	
	-- Inputs
	signal Av : std_logic_vector (3 downto 0) := (others => '0');
	signal Bv : std_logic_vector (3 downto 0) := (others => '0');
	signal Cin : std_logic := '0';
	
	-- Outputs
	signal Sv: std_logic_vector (3 downto 0);
	signal Cout: std_logic;
	
begin

	-- Instanciamiento de la unidad por probar
	uut : sumador_completo_4bits
	port map (			
					Av => Av,
					Bv => Bv,
					Cin => Cin,
					Sv => Sv,
					Cout => Cout
				);
			
	-- Proceso de estimulos
	stim_proc: process
	
	begin
	
		wait for 50 ns;
		-- (8 + 7) + 0 = F
		Av <= "1000";
		Bv <= "0111";
		Cin <= '0';
		
		wait for 25 ns;
		-- (3 + 4) + 1 = 8
		Av <= "0011";
		Bv <= "0100";
		Cin <= '1';
		
		wait for 25 ns;
		-- (1 + 2) + 0 = 3
		Av <= "0001";
		Bv <= "0010";
		Cin <= '0';
		
		wait for 25 ns;
		-- (5 + 6) + 1 = C
		Av <= "0101";
		Bv <= "0110";
		Cin <= '1';
		
		wait for 50 ns;

		wait;
	end process;
	
end behavior;
