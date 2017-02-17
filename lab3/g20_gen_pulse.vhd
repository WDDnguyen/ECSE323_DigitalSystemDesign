library ieee;
LIBRARY lpm;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE lpm.lpm_components.all;

entity g20_gen_pulse is
	port( 
		clock: in std_logic;
		EPULSE: out std_logic
		);
end g20_gen_pulse;


architecture g20_Pulse_arch of g20_gen_pulse is
 SIGNAL  q_out : std_logic_vector(24 downto 0);
  
  begin  
  lpm_counter12_component : lpm_counter
  GENERIC MAP (	
    lpm_width => 25,
	 -- change for gen test
	 lpm_modulus => 25000000)
  PORT MAP (
    clock   => clock,
    q  => q_out
  );  
  
process (clock)
	begin
		if (rising_edge(clock)) then
			if (unsigned(q_out) = 0) then
				Epulse <= '1';
			else
				Epulse <= '0';
			end if;
		end if;
	end process;

 
end g20_Pulse_arch;