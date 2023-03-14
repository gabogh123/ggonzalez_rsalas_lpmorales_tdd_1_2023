-------------------------------------------------------------------------
--
-- Test Bench para el Sumador Completo de 1 bit
--
-------------------------------------------------------------------------

library IEEE;
use IEEE.STd_logic_1164.all;

entity sumador_completo_1bit_tb is
end sumador_completo_1bit_tb;

architecture behavior of sumador_completo_1bit_tb is

	-- Declaracion de componente
	component sumador_completo_1bit is
	port ( A : in std_logic;
			 B : in std_logic;
			 I : in std_logic;
			 S : out std_logic;
			 C : out std_logic
			);
	end component;	
	
	-- Inputs
	signal A : std_logic := '0';
	signal B : std_logic := '0';
	signal I : std_logic := '0';
	
	-- Outputs
	signal S: std_logic;
	signal C: std_logic;
	
begin

	-- Instanciamiento
	uut : sumador_completo_1bit port map (			
				A => A,
				B => B,
				I => I,
				S => S,
				C => C			
			);
			
	-- Estimulos
	stim_proc: process
	
	begin
	
		wait for 50 ns;
		-- (0 + 0) + 0 = 0 0
		A <= '0';
		B <= '0';
		I <= '0';
		
		wait for 25 ns;
		-- (1 + 0) + 0 = 0 1
		A <= '1';
		B <= '0';
		
		wait for 25 ns;
		-- (0 + 1) + 0 = 0 1
		A <= '0';
		B <= '1';
		
		wait for 25 ns;
		-- (1 + 1) + 0 = 1 0
		A <= '1';
		B <= '1';
		
		wait for 25 ns;
		-- (0 + 0) + 0 = 0 0
		A <= '0';
		B <= '0';
		
		wait for 50 ns;
		-- (0 + 0) + 1 = 0 1
		I <= '1';
		
		wait for 75 ns;
		-- (0 + 0) + 1 = 0 1
		A <= '0';
		B <= '0';
		
		wait for 25 ns;
		-- (1 + 0) + 1 = 1 0
		A <= '1';
		B <= '0';
		
		wait for 25 ns;
		-- (0 + 1) + 1 = 1 0
		A <= '0';
		B <= '1';
		
		wait for 25 ns;
		-- (1 + 1) + 1 = 1 1
		A <= '1';
		B <= '1';
		
		wait for 25 ns;
		-- (0 + 0) + 0 = 0 0
		A <= '0';
		B <= '0';
		I <= '0';
		
		wait for 100 ns;
		

		
		wait;
	end process;
	
	
end behavior;
