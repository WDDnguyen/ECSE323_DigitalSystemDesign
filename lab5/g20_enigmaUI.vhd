library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g20_enigmaUI is 
port(	input : in std_logic_vector (4 downto 0);
		switches : in std_logic_vector( 4 downto 0);
		buttons : in std_logic_vector ( 3 downto 0);
		clk : in std_logic;
		displayL,displayR,displayM : out std_logic_vector(6 downto 0);
		led : out std_logic_vector (3 downto 0));

end g20_enigmaUI;

architecture behavior of g20_enigmaUI is 

component g20_gen_pulse is
	port( 
		clock: in std_logic;
		EPULSE: out std_logic
		);
end component;

component g20_enigma
port (
			  rotorL, rotorM, rotorR :in std_logic_vector( 1 downto 0);
			  clock, reset,init,reflect,keyPress  : in std_logic;
			  inputCode,ringSetting,dataL,dataM,dataR : in std_logic_vector(4 downto 0);
			  err1,err2,err3,err4,err5,err6,err7,err8,err9,err10,err11,err12,ierr1,ierr2,ierr3,ierr4,ierr5,ierr6,ierr7,ierr8,ierr9,ierr10,ierr11,ierr12 : out std_logic;
			  outputCode: out std_logic_vector(4 downto 0)
			  );
end component;

component g20_7_segment_decoder

port ( code : in std_logic_vector(4 downto 0);
		segments: out std_logic_vector(6 downto 0)
		);
		
end component;

Signal incode, outcode, ringset, dataL, dataM, dataR,temp, status: std_logic_vector (4 downto 0) := "00000";
	Signal rotorL, rotorM, rotorR: std_logic_vector(1 downto 0) := "00";
	Signal reflect, keypress: std_logic :='0';
	Signal init : std_logic := '1';
	Signal reset: std_logic := '1';
	

begin 


process (switches, buttons)
		begin
			if (rising_edge(clk))then
				--DataL,M,R
				if (switches(4) = '1')then
					status<= "00000";
					if (buttons(3) = '0')then
						dataL <= "00000";
						dataM <= "00000";
						dataR <= "00000";
						led(3) <= '1';
					elsif (buttons(2) = '0')then
						dataL <= input;
						led(2) <= '1';
					elsif (buttons(1) = '0')then
						dataM <= input;
						led(1) <= '1';
					elsif (buttons(0) = '0')then
						dataR <= input;
						led(0) <= '1';
					else
						led <= "0000";
					end if;
				
				--RotorL,M,R
				elsif (switches(3) = '1')then
					status<="00001";
					if (buttons(3) = '0')then
						rotorL <= "00";
						rotorM <= "00";
						rotorR <= "00";
						led(3) <= '1';
					elsif (buttons(2) = '0')then
						rotorL <= input (1 downto 0);
						led(2) <= '1';
					elsif (buttons(1) = '0')then
						rotorM <= input (1 downto 0);
						led(1) <= '1';
					elsif (buttons(0) = '0')then
						rotorR <= input (1 downto 0);
						led(0) <= '1';
					else
						led <= "0000";
					end if;
					
				-- ringsetting
				elsif (switches(2) = '1')then
					status <= "00010";
					if (buttons(3) = '0')then
						ringset <= "00000";
						led(1) <= '1';
					elsif (buttons(0) = '0') then
						ringset <= input;
						led(0) <= '1';
					else
						led <= "0000";
					end if;
				
				--reflector
				elsif (switches(1) = '1')then
					status <= "00011";
					if (buttons(1) = '0')then
						reflect <= '1';
						led(1) <= '1';
					elsif (buttons(0) = '0')then
						reflect <= '1';
						led(0) <= '1';
					else
						led <= "0000";
					end if;
					
				--reset
				elsif (switches (0) = '1')then
				status <= "0011";
					if (buttons(0) = '0')then
						ringset <= "00000";
						dataL <= "00000";
						dataM <= "00000";
						dataR <= "00000";
						rotorL <= "00";
						rotorM <= "00";
						rotorR <= "00";
						reflect <= '0';
						led(0) <= '1';
					else
						led<="0000";
					end if;
				else
					status <= "10100";
					if (buttons(0) = '0')then
						while (buttons(0) = '0') loop
						end loop;
						keypress <= '1';
						led <= "1111";
					elsif (buttons(2) = '0') then
						init <= '0';
						led (2) <= '1';
					elsif (buttons (3) = '0')then
						reset <= '0';
						led(3) <= '1';
					else
						led <= "0000";
						init <= '1';
						reset <= '1';
						if (keypress = '1') then
							keypress <= '0';
							incode <= input;
						end if;
					end if;
				end if;
			end if;
	 end process;
	 
	 EnigmaMachine : g20_enigma
	 port map (rotorL => rotorL,rotorM => rotorM,rotorR => rotorR,clock => clk,reset => reset,init => init ,reflect => reflect,keyPress => keyPress,inputCode => incode,ringSetting => ringset,dataL => dataL,dataM => dataM,dataR => dataR,outputCode => outcode,err1 => open, err2 => open,err3 => open,
	err4 => open,err5 => open,err6 => open,err7 => open,err8 => open,err9 => open, err10 => open,err11 => open,err12 => open,ierr1 => open,ierr2 => open,
	ierr3 => open,ierr4 => open,ierr5 => open,ierr6 => open,ierr7 => open,ierr8 => open,ierr9 => open,ierr10 => open,ierr11 => open,ierr12 => open	);

	leftDisplay : g20_7_segment_decoder
	port map (code => input, segments => displayL);
	
	rightDisplay : g20_7_segment_decoder
	port map (code => outcode, segments => displayR);
	
	middleDisplay : g20_7_segment_decoder 
	port map (code => status, segments => displayM);
	
	
end behavior;