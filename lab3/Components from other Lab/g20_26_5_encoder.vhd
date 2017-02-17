-- This circuit takes as input a 26-bit vector and produces a 5-bit output named 
-- INDEX which indicates the highest bit position over all input bits that have 
-- a high value. If no inputs bits are high, then assert an ERROR signal. 
 
library
ieee; -- allows use of the std_logic_vector type 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity g20_26_5_encoder is 
port
 ( letter : in std_logic_vector(25 downto 0); 
   INDEX : out std_logic_vector (4 downto 0); 
   ERROR: out std_logic);  
end g20_26_5_encoder;

ARCHITECTURE g20_26_5_encoder_arch OF g20_26_5_encoder IS
BEGIN






 ERROR <= not letter(0) and not letter(1) and not letter(2) and not letter(3)  and not letter(4) and not letter(5) and not letter(6) and not letter(7) and not letter(8) and not letter(9) and not letter(10)
  and not letter(11) and not letter(12) and not letter(13) and not letter(14) and not letter(15) and not letter(16) and not letter(17) and not letter(18) and not letter(19)
 and not letter(20) and not letter(21) and not letter(22) and not letter(23) and not letter(24) and not letter(25) ;
 
 
 INDEX <= std_logic_vector(to_unsigned(25,5)) when letter(25) = '1' else
			 std_logic_vector(to_unsigned(24,5)) when letter(24) = '1' else
			 std_logic_vector(to_unsigned(23,5)) when letter(23) = '1' else
			 std_logic_vector(to_unsigned(22,5)) when letter(22) = '1' else
			 std_logic_vector(to_unsigned(21,5)) when letter(21) = '1' else
			 std_logic_vector(to_unsigned(20,5)) when letter(20) = '1' else
			
			 std_logic_vector(to_unsigned(19,5)) when letter(19) = '1' else
			 std_logic_vector(to_unsigned(18,5)) when letter(18) = '1' else
			 std_logic_vector(to_unsigned(17,5)) when letter(17) = '1' else
			 std_logic_vector(to_unsigned(16,5)) when letter(16) = '1' else
			 std_logic_vector(to_unsigned(15,5)) when letter(15) = '1' else
			 std_logic_vector(to_unsigned(14,5)) when letter(14) = '1' else
			 std_logic_vector(to_unsigned(13,5)) when letter(13) = '1' else
			 std_logic_vector(to_unsigned(12,5)) when letter(12) = '1' else
			 std_logic_vector(to_unsigned(11,5)) when letter(11) = '1' else
			 std_logic_vector(to_unsigned(10,5)) when letter(10) = '1' else
			 
			 std_logic_vector(to_unsigned(9,5)) when letter(9) = '1' else
			 std_logic_vector(to_unsigned(8,5)) when letter(8) = '1' else
			 std_logic_vector(to_unsigned(7,5)) when letter(7) = '1' else
			 std_logic_vector(to_unsigned(6,5)) when letter(6) = '1' else
			 std_logic_vector(to_unsigned(5,5)) when letter(5) = '1' else
			 std_logic_vector(to_unsigned(4,5)) when letter(4) = '1' else
			 std_logic_vector(to_unsigned(3,5)) when letter(3) = '1' else
			 std_logic_vector(to_unsigned(2,5)) when letter(2) = '1' else
			 std_logic_vector(to_unsigned(1,5)) when letter(1) = '1' else
			 std_logic_vector(to_unsigned(0,5)) when letter(0) = '1';


	
 
END g20_26_5_encoder_arch;

	
		