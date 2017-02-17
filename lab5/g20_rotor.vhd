library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g20_rotor is
port (
		 Clk,Rst,enable,init : in std_logic;
		 rotorSetting : in std_logic_vector (1 downto 0);
		 data,input_code,inv_input_code : in std_logic_vector(4 downto 0);
		 Ring_setting : in std_logic_vector(4 downto 0);
		 C,InvC : buffer std_logic_vector(4 downto 0 );
		 output_code,inv_output_code : out std_logic_vector(4 downto 0);
		 InvErr1,InvErr2,InvErr3,InvErr4 : out std_logic;
		 err1,err2,err3,err4 : out std_logic);
		 
		 
end g20_rotor;

architecture behavior of g20_rotor is 

component g20_permutation
port (input_code : in std_logic_vector(4 downto 0);
		rotor_type : std_logic_vector ( 1 downto 0);
		 output_code : out std_logic_vector(4 downto 0);
		 inv_output_code : out std_logic_vector(4 downto 0));
end component;

component  g20_26_5_encoder 
port
 ( letter : in std_logic_vector(25 downto 0); 
   INDEX : out std_logic_vector (4 downto 0); 
   ERROR: out std_logic);  
end component;

component g20_decoder 
 Port (I : in std_logic_vector(4 downto 0);
	  D : out std_logic_vector(25 downto 0);
	  Error: out std_logic
	  );
end component; 

component g20_counter_FSM
port (
		data : in std_logic_vector( 4 downto 0);
		clock : in std_logic;
		reset:	in std_logic;
		enable:	in std_logic;
		init : in std_logic;
		Q : buffer std_logic_vector(4 downto 0));
end component;

component g20_Rotor_Comparator
generic (Rotor_knockValue : std_logic_vector (4 downto 0));
port (counter_output : in std_logic_vector (4 downto 0);
		knock_enable : out std_logic);
end component;

component g20_rotor_stepper_FSM
port(  keyPress, knock_M, knock_R, init,clock : in std_logic;
			 en_L, en_M, en_R,load : out std_logic );
end component;

component g20_gen_pulse 
port( 
		clock: in std_logic;
		EPULSE: out std_logic
		);
end component;

component g20_lab5_barrel_shifter_enigma 
generic (direction : std_logic);
port
 ( letter : in std_logic_vector(25 downto 0); 
   N : IN std_logic_vector(4 downto 0);
	shiftedValue : out std_logic_vector (25 downto 0));  

end component;

signal s1,s2,s3,s6,s7,s8, Inv1,Inv2,Inv3,Inv6,Inv7,Inv8 : std_logic_vector ( 25 downto 0);
signal s4,s5 , Inv4, Inv5 : std_logic_vector( 4 downto 0);  

begin

-- Right to Left
Counter : g20_counter_FSM 
port map (clock => Clk , reset => rst, init => init, enable => enable, Q => C, data => data);

inputDecoder : g20_decoder 
port map(I => input_code, D => S1, Error => err1);

prePermutationEncoder : g20_26_5_encoder 
port map( letter => s3, Index  => s4, Error => err2);

permutationDecoder : g20_decoder
port map ( I => s5, D => s6, Error => err3);

outputEncoder :  g20_26_5_encoder 
port map (letter => s8, index => output_code, Error => err4);

permutation : g20_permutation
port map (input_code => S4, output_code => S5,rotor_type => rotorSetting);

firstBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '0')
port map ( letter => s1, N => C ,shiftedValue => s2);

secondBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '1')
port map ( letter => s2, N => ring_setting ,shiftedValue => s3);

thirdBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '0')
port map ( letter => s6, N => ring_setting ,shiftedValue => s7);

fourthBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '1')
port map ( letter => s7, N => C ,shiftedValue => s8);


--Left to Right


InvCounter : g20_counter_FSM 
 
port map (clock => Clk , reset => rst, init => init, enable => enable, Q => InvC,data => data);

InvInputDecoder : g20_decoder 
port map(I => inv_input_code, D => Inv1, Error => InvErr1);

InvPermutationEncoder : g20_26_5_encoder 
port map( letter => Inv3, Index  => Inv4, Error => InvErr2);

InvPermutationDecoder : g20_decoder
port map ( I => Inv5, D => Inv6, Error => InvErr3);

InvOutputEncoder :  g20_26_5_encoder 
port map (letter => Inv8, index => Inv_output_code, Error => InvErr4);

InvPermutation : g20_permutation
port map (input_code => Inv4, inv_output_code => Inv5,rotor_type => rotorSetting);

InvFirstBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '1')
port map ( letter => Inv1, N => InvC ,shiftedValue => Inv2);

InvSecondBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '0')
port map ( letter => Inv2, N => ring_setting ,shiftedValue => Inv3);

InvThirdBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '1')
port map ( letter => Inv6, N => ring_setting ,shiftedValue => Inv7);

InvFourthBarrel : g20_lab5_barrel_shifter_enigma
generic map (direction => '0')
port map ( letter => Inv7, N => InvC ,shiftedValue => Inv8);

end behavior;
