library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity g20_enigma is 
port (
			  rotorL, rotorM, rotorR :in std_logic_vector( 1 downto 0);
			  clock, reset,init,reflect,keyPress  : in std_logic;
			  inputCode,ringSetting,dataL,dataM,dataR : in std_logic_vector(4 downto 0);
			  err1,err2,err3,err4,err5,err6,err7,err8,err9,err10,err11,err12,ierr1,ierr2,ierr3,ierr4,ierr5,ierr6,ierr7,ierr8,ierr9,ierr10,ierr11,ierr12 : out std_logic;
			  outputCode: out std_logic_vector(4 downto 0)
			  );
			  
end g20_enigma;

architecture behavior of g20_enigma is 
component g20_stecker
port ( input_code : in std_logic_vector(4 downto 0);
		  output_code : out std_logic_vector(4 downto 0));
end component;

component g20_rotor
port (
		 Clk,Rst,enable,init : in std_logic;
		 C,InvC : buffer std_logic_vector(4 downto 0 );
		 input_code,inv_input_code : in std_logic_vector(4 downto 0);
		 rotorSetting : in std_logic_vector(1 downto 0);
		 Ring_setting,data : in std_logic_vector(4 downto 0);
		 output_code,inv_output_code : out std_logic_vector(4 downto 0);
		 InvErr1,InvErr2,InvErr3,InvErr4 : out std_logic;
		 err1,err2,err3,err4 : out std_logic);

end component;

component g20_reflector
port ( input_code : in std_logic_vector(4 downto 0);
		 reflector_type : in std_logic;
		 output_code : out std_logic_vector(4 downto 0));
end component;

component g20_rotor_stepper_FSM
port(  keyPress, knock_M, knock_R, init,clock : in std_logic;
			 en_L, en_M, en_R,load : out std_logic );
end component;

component g20_Rotor_Comparator
generic (Rotor_knockValue : std_logic_vector (4 downto 0));
port (counter_output : in std_logic_vector (4 downto 0);
		knock_enable : out std_logic);
end component;

component g20_gen_pulse 
port( 
		clock: in std_logic;
		EPULSE: out std_logic
		);
end component;

signal i1,i2,i3,i4,i5,i6,i7,i8,countM,countR : std_logic_vector(4 downto 0);
signal load, enL, enM, enR , knockM , knockR, pulse : std_logic;


begin

stecker : g20_stecker
port map (input_code => inputCode, output_code => i1);

rightComparator : g20_Rotor_Comparator
generic map (Rotor_knockValue => "00110")
port map (counter_output => countR, knock_enable => knockR);

middleComparator : g20_Rotor_Comparator
generic map (Rotor_knockValue => "00100")
port map (counter_output => countM, knock_enable => knockM);

rotor_stepper : g20_rotor_stepper_FSM
port map (keyPress=> keyPress, knock_M => knockM, knock_R =>knockR, init => init, clock => clock,en_L => enL, en_M => enM, en_R=> enR, load => load);

reflector : g20_reflector
port map (input_code => i4, reflector_type => reflect, output_code => i5);

rightRotor : g20_rotor
port map (clk => clock, init => load,enable => enR, rst => reset, input_code => i1, inv_input_code => i7, ring_setting => ringSetting, output_code=>i2, inv_output_code => i8,
			 InvErr1 => ierr1, InvErr2 => ierr2, InvErr3 => ierr3, InvErr4 => ierr4, err1 => err1, err2 => err2, err3 => err3, err4 => err4, C => countR,invC => open, data =>dataR,rotorSetting => rotorR);

middleRotor : g20_rotor 
port map (clk => clock, init => load, enable => enM , rst => reset, input_code => i2, inv_input_code => i6, ring_setting => ringSetting, output_code=>i3, inv_output_code => i7,
			 InvErr1 => ierr5, InvErr2 => ierr6, InvErr3 => ierr7, InvErr4 => ierr8, err1 => err5, err2 => err6, err3 => err7, err4 => err8, C =>countM, invC => open, data =>dataM,rotorSetting => rotorM);

leftRotor : g20_rotor
port map (clk => clock, init => load, enable => enL,rst => reset, input_code => i3, inv_input_code => i5, ring_setting => ringSetting, output_code=>i4, inv_output_code => i6,
			 InvErr1 => ierr9, InvErr2 => ierr10, InvErr3 => ierr11, InvErr4 => ierr12, err1 => err9, err2 => err10, err3 => err11, err4 => err12, data =>dataL,rotorSetting => rotorL, C=>open, invC => open);
			 
secondStecker : g20_stecker 
port map (input_code => i8, output_code => outputCode);			 
end behavior;