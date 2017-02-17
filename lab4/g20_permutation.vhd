library ieee;
use ieee.std_logic_1164.all;

entity g20_permutation is
port (input_code : in std_logic_vector(4 downto 0);
		 rotor_type : in std_logic_vector(1 downto 0);
		 output_code : out std_logic_vector(4 downto 0);
		 inv_output_code : out std_logic_vector(4 downto 0));
end g20_permutation;

architecture behavior of g20_permutation is

begin 
process (rotor_type, input_code)
begin
case rotor_type is

when "00" => 
	case input_code is 
	when "00000" => output_code <= "00100"; -- A -> E
						 inv_output_code <= "10100"; -- A -> U 
	when "00001" => output_code <= "01010"; -- B -> K
						 inv_output_code <= "10110"; -- B -> W 
	when "00010" => output_code <= "01100"; -- C -> M
						 inv_output_code <= "11000"; --  C --> Y 
	when "00011" => output_code <= "00101"; -- D -> F
						 inv_output_code <= "00110"; -- D -> G
	when "00100" => output_code <= "01011"; -- E -> L	
						 inv_output_code <= "00000"; -- E -> A 
	when "00101" => output_code <= "00110"; -- F -> G
						 inv_output_code <= "00011"; -- F -> D
	when "00110" => output_code <= "00011"; -- G -> D
						 inv_output_code <= "00101"; -- G -> F
	when "00111" => output_code <= "10000"; -- H -> Q
						 inv_output_code <= "01111"; -- H -> P
	when "01000" => output_code <= "10101"; -- I -> V
						 inv_output_code <= "10101"; -- I -> V
	when "01001" => output_code <= "11001"; -- J -> Z
						 inv_output_code <= "11001"; -- J -> Z	
	when "01010" => output_code <= "01101"; -- K -> N
						 inv_output_code <= "00001"; -- K -> B
	when "01011" => output_code <= "10011"; -- L -> T
						 inv_output_code <= "00100"; -- L -> E
	when "01100" => output_code <= "01110"; -- M -> 0
						 inv_output_code <= "00010"; -- M -> C
	when "01101" => output_code <= "10110"; -- N -> W
						 inv_output_code <= "01010"; -- N -> K
	when "01110" => output_code <= "11000"; -- O -> Y
						 inv_output_code <= "01100"; -- O -> M
	when "01111" => output_code <= "00111"; -- P -> H
						 inv_output_code <= "10011"; -- P -> T
	when "10000" => output_code <= "10111"; -- Q -> X
						 inv_output_code <= "00111"; -- Q -> H
	when "10001" => output_code <= "10100"; -- R -> U
						 inv_output_code <= "10111"; -- R -> X
	when "10010" => output_code <= "10010"; -- S -> S
						 inv_output_code <= "10010"; -- S -> S
	when "10011" => output_code <= "01111"; -- T -> P
						 inv_output_code <= "01011"; -- T -> L
	when "10100" => output_code <= "00000"; -- U -> A
						 inv_output_code <= "10001"; -- U -> R
	when "10101" => output_code <= "01000"; -- V -> I
						 inv_output_code <= "01000"; -- V -> I
	when "10110" => output_code <= "00001"; -- W -> B
						 inv_output_code <= "01101"; -- W -> N
	when "10111" => output_code <= "10001"; -- X -> R
						 inv_output_code <= "10000"; -- X -> Q	
	when "11000" => output_code <= "00010"; -- Y -> C
						 inv_output_code <= "01110"; -- Y -> O
	when "11001" => output_code <= "01001";  -- Z -> J
						 inv_output_code <= "01001"; -- Z -> J
	when others => output_code <= "00000";
						inv_output_code <= "00000";
   end case;
	

when "01" => 
	
	case input_code is 
	when "00000" => output_code <= "00000"; -- A -> A
						 inv_output_code <= "00000"; -- A -> A
	when "00001" => output_code <= "01001"; -- B -> J
						 inv_output_code <= "01001"; -- B -> J 
	when "00010" => output_code <= "00011"; -- C -> D
						 inv_output_code <= "01111"; -- C -> P
	when "00011" => output_code <= "01010"; -- D -> K
						 inv_output_code <= "00010"; -- D -> C
	when "00100" => output_code <= "10010"; -- E -> S
						 inv_output_code <= "11001"; -- E -> Z	
	when "00101" => output_code <= "01000"; -- F -> I
						 inv_output_code <= "10110"; -- F -> W
	when "00110" => output_code <= "10001"; -- G -> R
						 inv_output_code <= "10001"; -- G -> R	
	when "00111" => output_code <= "10100"; -- H -> U
						 inv_output_code <= "01011"; -- H -> L	
	when "01000" => output_code <= "10111"; -- I -> X
						 inv_output_code <= "00101"; -- I -> F
	when "01001" => output_code <= "00001"; -- J -> B
						 inv_output_code <= "00001"; -- J -> B
	when "01010" => output_code <= "01011"; -- K -> L
						 inv_output_code <= "00011"; -- K -> D	
	when "01011" => output_code <= "00111"; -- L -> H
						 inv_output_code <= "01010"; -- L -> K
	when "01100" => output_code <= "10110"; -- M -> W
						 inv_output_code <= "01110"; -- M -> O
	when "01101" => output_code <= "10011"; -- N -> T
						 inv_output_code <= "10011"; -- N -> T
	when "01110" => output_code <= "01100"; -- O -> M
						 inv_output_code <= "11000"; -- O -> Y
	when "01111" => output_code <= "00010"; -- P -> C
						 inv_output_code <= "10100"; -- P -> U
	when "10000" => output_code <= "10000"; -- Q -> Q
						 inv_output_code <= "10000"; -- Q -> Q
	when "10001" => output_code <= "00110"; -- R -> G
						 inv_output_code <= "00110"; -- R -> G
	when "10010" => output_code <= "11001"; -- S -> Z
						 inv_output_code <= "00100"; -- S -> E
	when "10011" => output_code <= "01101"; -- T -> N
						 inv_output_code <= "01101"; -- T -> N
	when "10100" => output_code <= "01111"; -- U -> P
						 inv_output_code <= "00111"; -- U -> H
	when "10101" => output_code <= "11000"; -- V -> Y
						 inv_output_code <= "10111"; -- V -> X
	when "10110" => output_code <= "00101"; -- W -> F
						 inv_output_code <= "01100"; -- W -> M
	when "10111" => output_code <= "10101"; -- X -> V
						 inv_output_code <= "01000"; -- X -> I	
	when "11000" => output_code <= "01110"; -- Y -> O
						 inv_output_code <= "10101"; -- Y -> V
	when "11001" => output_code <= "00100";  -- Z -> E
						 inv_output_code <= "10010"; -- Z -> S
   when others => output_code <= "00000";
						 inv_output_code <= "00000";
			
	end case;
	
	
when "10" =>
	
	case input_code is 
	when "00000" => output_code <= "00001"; -- A -> B
						 inv_output_code <= "10011"; -- A -> T
	when "00001" => output_code <= "00011"; -- B -> D
						 inv_output_code <= "00000"; -- B -> A
	when "00010" => output_code <= "00101"; -- C -> F
						 inv_output_code <= "00110"; -- C -> G	
	when "00011" => output_code <= "00111"; -- D -> H
						 inv_output_code <= "00001"; -- D -> B
	when "00100" => output_code <= "01001"; -- E -> J
						 inv_output_code <= "01111"; -- E -> P	
	when "00101" => output_code <= "01011"; -- F -> L
						 inv_output_code <= "00010"; -- F -> C
	when "00110" => output_code <= "00010"; -- G -> C
						 inv_output_code <= "10010"; -- G -> S
	when "00111" => output_code <= "01111"; -- H -> P
						 inv_output_code <= "00011"; -- H -> D
	when "01000" => output_code <= "10001"; -- I -> R
						 inv_output_code <= "10000"; -- I -> Q
	when "01001" => output_code <= "10011"; -- J -> T
						 inv_output_code <= "00100"; -- J -> E
	when "01010" => output_code <= "10111"; -- K -> X
						 inv_output_code <= "10100"; -- K -> U
	when "01011" => output_code <= "10101"; -- L -> V
						 inv_output_code <= "00101"; -- L -> F
	when "01100" => output_code <= "11001"; -- M -> Z
						 inv_output_code <= "10101"; -- M -> V
	when "01101" => output_code <= "01101";  -- N -> N
						 inv_output_code <= "01101"; -- N -> N
	when "01110" => output_code <= "11000"; -- O -> Y
						 inv_output_code <= "11001"; -- O -> Z
	when "01111" => output_code <= "00100"; -- P -> E
						 inv_output_code <= "00111"; -- P -> H
	when "10000" => output_code <= "01000"; -- Q -> I
						 inv_output_code <= "11000"; -- Q -> Y
	when "10001" => output_code <= "10110"; -- R -> W
						 inv_output_code <= "01000"; -- R -> I
	when "10010" => output_code <= "00110"; -- S -> G
						 inv_output_code <= "10111"; -- S -> X
	when "10011" => output_code <= "00000"; -- T -> A
						 inv_output_code <= "01001"; -- T -> J
	when "10100" => output_code <= "01010"; -- U -> K
						 inv_output_code <= "10110"; -- U -> W
	when "10101" => output_code <= "01100"; -- V -> M
						 inv_output_code <= "01011"; -- V -> L
	when "10110" => output_code <= "10100"; -- W -> U
						 inv_output_code <= "10001"; -- W -> R
	when "10111" => output_code <= "10010"; -- X -> S
						 inv_output_code <= "01010"; -- X -> K	
	when "11000" => output_code <= "10000"; -- Y -> Q
						 inv_output_code <= "01110"; -- Y -> O
	when "11001" => output_code <= "01110";  -- Z -> O
						 inv_output_code <= "01100"; -- Z -> M
	when others => output_code <= "00000";
						 inv_output_code <= "00000"; 
  end case;
	
when "11" => 
	
	case input_code is 
	when "00000" => output_code <= "00100"; --  A -> E
						 inv_output_code <= "00111"; -- A -> H
	when "00001" => output_code <= "10010"; --  B -> S
						 inv_output_code <= "11001"; -- B -> Z
	when "00010" => output_code <= "01110"; -- C -> O
						 inv_output_code <= "10110"; -- C -> W
	when "00011" => output_code <= "10101"; -- D -> V
						 inv_output_code <= "10101"; -- D -> V
	when "00100" => output_code <= "01111"; -- E -> P
						 inv_output_code <= "00000"; -- E -> A	
	when "00101" => output_code <= "11001"; -- F -> Z
						 inv_output_code <= "10001"; -- F -> R
	when "00110" => output_code <= "01001"; -- G -> J
						 inv_output_code <= "10011"; -- G -> T
	when "00111" => output_code <= "00000"; -- H -> A
						 inv_output_code <= "01101"; -- H -> N
	when "01000" => output_code <= "11000"; -- I -> Y
						 inv_output_code <= "01011"; -- I -> L
	when "01001" => output_code <= "10000"; -- J -> Q
						 inv_output_code <= "00110"; -- J -> G
	when "01010" => output_code <= "10100"; -- K -> U
						 inv_output_code <= "10100"; -- K -> U 
	when "01011" => output_code <= "01000"; -- L -> I
						 inv_output_code <= "01111"; -- L -> P
	when "01100" => output_code <= "10001"; -- M -> R
						 inv_output_code <= "10111"; -- M -> X
	when "01101" => output_code <= "00111"; -- N -> H
						 inv_output_code <= "10000"; -- N -> Q
	when "01110" => output_code <= "10111"; -- O -> X
						 inv_output_code <= "00010"; -- O -> C
	when "01111" => output_code <= "01011"; -- P -> L
						 inv_output_code <= "00100"; -- P -> E
	when "10000" => output_code <= "01101"; -- Q -> N
						 inv_output_code <= "01001"; -- Q -> J
	when "10001" => output_code <= "00101"; -- R -> F
						 inv_output_code <= "01100"; -- R -> M
	when "10010" => output_code <= "10011"; -- S -> T
						 inv_output_code <= "00001"; -- S -> B
	when "10011" => output_code <= "00110"; -- T -> G
						 inv_output_code <= "10010"; -- T -> S
	when "10100" => output_code <= "01010"; -- U -> K
						 inv_output_code <= "01010"; -- U -> K
	when "10101" => output_code <= "00011"; -- V -> D
						 inv_output_code <= "00011"; -- V -> D
	when "10110" => output_code <= "00010"; -- W -> C
						 inv_output_code <= "11000"; -- W -> Y
	when "10111" => output_code <= "01100"; -- X -> M
						 inv_output_code <= "01110"; -- X -> O	
	when "11000" => output_code <= "10110"; -- Y -> W
						 inv_output_code <= "01000"; -- Y -> I
	when "11001" => output_code <= "00001"; -- Z -> B
						 inv_output_code <= "00101"; -- Z -> F	
	when others => output_code <= "00000";
   end case;


	
when others => output_code <= "00000";
					inv_output_code <= "00000";
end case;
end process;
end behavior;

 				