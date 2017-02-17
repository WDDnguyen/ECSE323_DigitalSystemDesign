library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity g20_lab3 is

port(	clock:	in std_logic;
	reset:	in std_logic;
	enable:	in std_logic;
	Q:	buffer std_logic_vector(4 downto 0) := "00000"
);
end g20_lab3;

architecture counter of g20_lab3 is		 	  
	
begin

process(clock,reset)
	begin
		if reset = '0' then
			Q <= "00000";
		elsif rising_edge(clock) then
			if enable = '1' then
			  if Q = "11001" then
			    Q <= "00000";
			   else 
				Q <= Q+1;
			end if;
			end if;
		end if;
	end process;	
end counter;