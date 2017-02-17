library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity g20_Rotor_Comparator is 
port (Rotor_knockValue, counter_output : in std_logic_vector (4 downto 0);
		knock_enable : out std_logic);
end g20_Rotor_Comparator;

architecture g20_Rotor_Comparator_arch of g20_Rotor_Comparator is
begin

knock_enable <= '1' when (rotor_knockValue = counter_output) else
					 '0';

end g20_Rotor_Comparator_arch;

