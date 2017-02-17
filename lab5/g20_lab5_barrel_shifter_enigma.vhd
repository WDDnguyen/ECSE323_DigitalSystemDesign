library
ieee; -- allows use of the std_logic_vector type 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity g20_lab5_barrel_shifter_enigma is
generic ( direction : in std_logic := '1');
port
 ( letter : in std_logic_vector(25 downto 0); 
   N : IN std_logic_vector(4 downto 0);
	
	shiftedValue : out std_logic_vector (25 downto 0));  

	end g20_lab5_barrel_shifter_enigma;

ARCHITECTURE g20_barrel_shifter_arch OF g20_lab5_barrel_shifter_enigma IS

BEGIN
 
process (n,letter)
begin 
 case direction is 
 when '0' => 
 
 case N is
-- shift to left
when "00000" => shiftedValue <= letter(25 downto 0);
when "00001" => shiftedValue <= letter(24 downto 0) & letter(25);
when "00010" => shiftedValue <= letter(23 downto 0) & letter(25 downto 24);
when "00011" => shiftedValue <= letter(22 downto 0) & letter(25 downto 23);
when "00100" => shiftedValue <= letter(21 downto 0) & letter(25 downto 22);
when "00101" => shiftedValue <= letter(20 downto 0) & letter(25 downto 21);
when "00110" => shiftedValue <= letter(19 downto 0) & letter(25 downto 20);
when "00111" => shiftedValue <= letter(18 downto 0) & letter(25 downto 19);
when "01000" => shiftedValue <= letter(17 downto 0) & letter(25 downto 18);
when "01001" => shiftedValue <= letter(16 downto 0) & letter(25 downto 17);
when "01010" => shiftedValue <= letter(15 downto 0) & letter(25 downto 16);
when "01011" => shiftedValue <= letter(14 downto 0) & letter(25 downto 15);
when "01100" => shiftedValue <= letter(13 downto 0) & letter(25 downto 14);
when "01101" => shiftedValue <= letter(12 downto 0) & letter(25 downto 13);
when "01110" => shiftedValue <= letter(11 downto 0) & letter(25 downto 12);
when "01111" => shiftedValue <= letter(10 downto 0) & letter(25 downto 11);
when "10000" => shiftedValue <= letter(9 downto 0) & letter(25 downto 10);
when "10001" => shiftedValue <= letter(8 downto 0) & letter(25 downto 9);
when "10010" => shiftedValue <= letter(7 downto 0) & letter(25 downto 8);
when "10011" => shiftedValue <= letter(6 downto 0) & letter(25 downto 7);
when "10100" => shiftedValue <= letter(5 downto 0) & letter(25 downto 6);
when "10101" => shiftedValue <= letter(4 downto 0) & letter(25 downto 5);
when "10110" => shiftedValue <= letter(3 downto 0) & letter(25 downto 4);
when "10111" => shiftedValue <= letter(2 downto 0) & letter(25 downto 3);
when "11000" => shiftedValue <= letter(1 downto 0) & letter(25 downto 2);
when "11001" => shiftedValue <= letter(0) & letter(25 downto 1);
when others  => shiftedValue <= letter(25 downto 0);
 end case ;
 
 when '1' =>
 
 case N is 
 -- shift to right 
 when "00000" => shiftedValue <= letter(25 downto 0);
when "00001" => shiftedValue <= letter(25) & letter(24 downto 0);
when "00010" => shiftedValue <= letter(25 downto 24) & letter(23 downto 0);
when "00011" => shiftedValue <= letter(25 downto 23) & letter(22 downto 0);
when "00100" => shiftedValue <= letter(25 downto 22) & letter(21 downto 0);
when "00101" => shiftedValue <= letter(25 downto 21) & letter(20 downto 0);
when "00110" => shiftedValue <= letter(25 downto 20) & letter(19 downto 0);
when "00111" => shiftedValue <= letter(25 downto 19) & letter(18 downto 0);
when "01000" => shiftedValue <= letter(25 downto 18) & letter(17 downto 0);
when "01001" => shiftedValue <= letter(25 downto 17) & letter(16 downto 0);
when "01010" => shiftedValue <= letter(25 downto 16) & letter(15 downto 0);
when "01011" => shiftedValue <= letter(25 downto 15) & letter(14 downto 0);
when "01100" => shiftedValue <= letter(25 downto 14) & letter(13 downto 0);
when "01101" => shiftedValue <= letter(25 downto 13) & letter(12 downto 0);
when "01110" => shiftedValue <= letter(25 downto 12) & letter(11 downto 0);
when "01111" => shiftedValue <= letter(25 downto 11) & letter(10 downto 0);
when "10000" => shiftedValue <= letter(25 downto 10) & letter(9 downto 0);
when "10001" => shiftedValue <= letter(25 downto 9) & letter(8 downto 0);
when "10010" => shiftedValue <= letter(25 downto 8) & letter(7 downto 0);
when "10011" => shiftedValue <= letter(25 downto 7) & letter(6 downto 0);
when "10100" => shiftedValue <= letter(25 downto 6) & letter(5 downto 0);
when "10101" => shiftedValue <= letter(25 downto 5) & letter(4 downto 0);
when "10110" => shiftedValue <= letter(25 downto 4) & letter(3 downto 0);
when "10111" => shiftedValue <= letter(25 downto 3) & letter(2 downto 0);
when "11000" => shiftedValue <= letter(25 downto 2) & letter(1 downto 0);
when "11001" => shiftedValue <= letter(25 downto 1) & letter(0);
when others  => shiftedValue <= letter(25 downto 0);

end case;

when others =>

end case;
end process;
end g20_barrel_shifter_arch;