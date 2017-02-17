LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY g20_decoder IS

PORT
	  (I : in std_logic_vector(4 downto 0);
	  D : out std_logic_vector(25 downto 0);
	  Error: out std_logic
	  );
END g20_decoder;

ARCHITECTURE g20_decoder_arch OF g20_decoder IS

BEGIN

D(0) <= not I(4) and not I(3) and not I(2) and not I(1) and not I(0);
D(1) <= not I(4) and not I(3) and not I(2) and not I(1) and I(0);
D(2) <= not I(4) and not I(3) and not I(2) and not I(0) and I(1);
D(3) <= not I(4) and not I(3) and not I(2) and I(1) and I(0);

D(4) <= not I(4) and not I(3) and not I(1) and not I(0) and I(2);
D(5) <= not I(4) and not I(3) and  not I(1) and I(2) and I(0);
D(6) <= not I(4) and not I(3) and not I(0) and I(2) and I(1);
D(7) <= not I(4) and not I(3) and I(2) and I(1) and I(0);

D(8) <= not I(4) and not I(2) and not I(1) and not I(0) and I(3);
D(9) <= not I(4) and not I(2) and not I(1) and I(3) and I(0);
D(10) <= not I(4) and not I(2) and not I(0) and I(3) and I(1);
D(11) <= not I(4) and not I(2) and  I(3) and I(1) and I(0);
D(12) <= not I(4) and not I(1) and not I(0) and I(3) and I(2);
D(13) <= not I(4) and not I(1) and I(3) and I(2) and I(0);
D(14) <= not I(4) and not I(0) and I(3) and I(2) and I(1);
D(15) <= not I(4) and I(3) and I(2) and I(1) and I(0);

D(16) <=not I(3) and not I(2) and not I(1) and not I(0) and I(4);
D(17) <=not I(3) and not I(2) and not I(1) and I(4) and I(0);
D(18) <=not I(3) and not I(2) and not I(0) and I(4) and I(1);
D(19) <=not I(3) and not I(2) and I(4) and I(1) and I(0);
D(20) <=not I(3) and not I(1) and not I(0) and I(4) and I(2);
D(21) <=not I(3) and not I(1) and I(4) and I(2) and I(0);
D(22) <=not I(3) and not I(0) and I(4) and I(2) and I(1);
D(23) <=not I(3) and I(4) and I(2) and I(1) and I(0);
D(24) <=not I(2) and not I(1) and not I(0) and I(4) and I(3);
D(25) <=not I(2) and not I(1) and I(4) and I(3) and I(0);

Error <= I(4) and I(3) and (I(2) or I(1));
			
END g20_decoder_arch;

