library
ieee; -- allows use of the std_logic_vector type 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity g20_barrel_shifter is 
port
 ( letter : in std_logic_vector(25 downto 0); 
   N : IN std_logic_vector(4 downto 0);
	shiftedValue : out std_logic_vector (25 downto 0));  

	end g20_barrel_shifter;

ARCHITECTURE g20_barrel_shifter_arch OF g20_barrel_shifter IS
BEGIN


with N select 
				
 shiftedValue <= 	  letter(25 downto 0) when "00000",
	                  letter(24 downto 0) & letter(25)  when "00001",
			  letter(23 downto 0) & letter(25 downto 24) when "00010",
			  letter(22 downto 0) & letter(25 downto 23) when "00011",
			  letter(21 downto 0) & letter(25 downto 22) when "00100",
			  letter(20 downto 0) & letter(25 downto 21) when "00101",
			  letter(19 downto 0) & letter(25 downto 20) when "00110",
			  letter(18 downto 0) & letter(25 downto 19) when "00111",
			  letter(17 downto 0) & letter(25 downto 18) when "01000",
			  letter(16 downto 0) & letter(25 downto 17) when "01001",
			  letter(15 downto 0) & letter(25 downto 16) when "01010",
			  letter(14 downto 0) & letter(25 downto 15) when "01011",
			  letter(13 downto 0) & letter(25 downto 14) when "01100",
			  letter(12 downto 0) & letter(25 downto 13) when "01101",
			  letter(11 downto 0) & letter(25 downto 12) when "01110",
			  letter(10 downto 0) & letter(25 downto 11) when "01111",
			  letter(9 downto 0) & letter(25 downto 10) when "10000",
			  letter(8 downto 0) & letter(25 downto 9) when "10001",
			  letter(7 downto 0) & letter(25 downto 8) when "10010",
			  letter(6 downto 0) & letter(25 downto 7) when "10011",
			  letter(5 downto 0) & letter(25 downto 6) when "10100",
			  letter(4 downto 0) & letter(25 downto 5) when "10101",
			  letter(3 downto 0) & letter(25 downto 4) when "10110",
			  letter(2 downto 0) & letter(25 downto 3) when "10111",
			  letter(1 downto 0) & letter(25 downto 2) when "11000",
			  letter(0) & letter(25 downto 1) when "11001",
			  letter(25 downto 0) when others;
			  

end g20_barrel_shifter_arch;