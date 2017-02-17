library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g20_rotor_stepper_FSM is 
	port(  keyPress, knock_M, knock_R, init,clock : in std_logic;
			 en_L, en_M, en_R,load : out std_logic );

end entity g20_rotor_stepper_FSM;

architecture behavior of g20_rotor_stepper_FSM is 
	type state_type is (s0, s1, s2,s3,s4,s5,s6,s7); -- 3-state process
	signal state : state_type;
	begin

	process (clock)
	begin

	 if rising_edge(clock) then
	  case state is 	
	  when s0 => if init = '0' then 
						load <= '1';
					   else 
					   state <= s1;
					   end if;
					  
	  when s1 =>  -- stays in this state if the keyPress isn't pressed.
					 if init = '0' then
					 state <= s0;
					 
					elsif keyPress ='0' then
						load <= '0';
						en_L <= '0';
						en_M <= '0';
						en_R <= '0';
						state <= s2;
						end if;
						
	  when s2 =>  -- stays in this state if the keyPress isn't release.
					if init = '0' then
					state <= s0;
					
					elsif keyPress ='1' then
					state <= s3;
					
					else 
					state <= s2;
					end if;
					
	  when s3 =>
					 if init = '0' then
					 state <= s0;
					
					 elsif (knock_R = '0' and knock_M ='0') then 
						 state <= s4;
					 
					 elsif (knock_R = '1' and knock_M ='0') then
						 state <= s5;
						 
					 elsif (knock_R = '0' and knock_M ='1') then
						 state <= s6;
						 
					 else
						 state <= s7;
					 
					 end if;
					
		when s4 =>    
						 en_L <= '0';
						 en_M <= '0';
						 en_R <= '1';
						 state <= s1;
						
		
		when s5 =>  
						en_L <= '0';
						 en_M <= '1';
						 en_R <= '1';
						 
						 state <= s1;
						 
					  
		
		when s6 =>  
						 en_L <= '1';
						 en_M <= '1';
						 en_R <= '1';
						 state <= s1;
		when s7 => 
		
						 en_L <= '1';
						 en_M <= '1';
						 en_R <= '1';
						 state <= s1;
					 
						 			 
end case;
end if;
end process;
end behavior;
			 
			