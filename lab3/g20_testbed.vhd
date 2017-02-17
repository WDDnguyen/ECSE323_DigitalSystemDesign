library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity g20_testbed is
	port( 
		switches: in std_logic_vector(4 downto 0);
		clk, rst: in std_logic;
		err1,err2: out std_logic;
		output: out std_logic_vector(6 downto 0)
	);
end g20_testbed;

architecture g20_testbed_arch of g20_testbed is
	
	component g20_gen_pulse
		port( 
			clock: in std_logic;
			EPULSE: out std_logic
		);
	end component;
	
	component g20_lab3
		port(
			reset, enable, clock:	in std_logic;
			Q:	buffer std_logic_vector(4 downto 0));
	end component;
	
	component g20_Enigma
		PORT(
			I: in std_logic_vector(4 downto 0);
			D: out std_logic_vector(25 downto 0);
			ERROR: out std_logic);
	end component;
	
	component g20_26_5_encoder
		port( 
			letter: in std_logic_vector(25 downto 0);
			INDEX: out std_logic_vector(4 downto 0);
			ERROR: out std_logic);
	end component;
	
	component g20_Barrel_Shifter
		port( 
			n: in std_logic_vector(4 downto 0);
			letter: in std_logic_vector(25 downto 0);
			shiftedValue: out std_logic_vector(25 downto 0)
		);
	end component;
	
	component g20_7_segment_decoder
		port( 
		code: in std_logic_vector(4 downto 0);
		segments: out std_logic_vector(6 downto 0)
		);
	end component;
	
	Signal I1 : std_logic;
	Signal I2,I5 : std_logic_vector(4 downto 0);
	Signal I3,I4 : std_logic_vector(25 downto 0);
begin
		G1: g20_gen_pulse port map (clock => clk, Epulse => I1);
		G2: g20_lab3 port map(reset => rst, enable => I1, clock => clk, q => I2);
		G3: g20_Barrel_Shifter port map(n => I2, letter => I3 , shiftedValue => I4 );
		G4: g20_Enigma port map(I=> switches, D => I3, Error => err1);
		G5: g20_26_5_encoder port map (letter => I4, index=> I5, error => err2);
		G6: g20_7_segment_decoder port map(code => I5, segments => output);
		
end g20_testbed_arch;