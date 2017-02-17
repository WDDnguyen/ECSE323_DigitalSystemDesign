library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity g20_reflector is
port ( input_code : in std_logic_vector(4 downto 0);
		 reflector_type : in std_logic;
		 output_code : out std_logic_vector(4 downto 0));
end g20_reflector;



architecture behavior of g20_reflector is 
constant a : std_logic_vector (4 downto 0) := "00000";
constant b : std_logic_vector (4 downto 0) := "00001";
constant c : std_logic_vector (4 downto 0) := "00010";
constant d : std_logic_vector (4 downto 0) := "00011";
constant e : std_logic_vector (4 downto 0) := "00100";
constant f : std_logic_vector (4 downto 0) := "00101";
constant g : std_logic_vector (4 downto 0) := "00110";
constant h : std_logic_vector (4 downto 0) := "00111";
constant i : std_logic_vector (4 downto 0) := "01000";
constant j : std_logic_vector (4 downto 0) := "01001";
constant k : std_logic_vector (4 downto 0) := "01010";
constant l : std_logic_vector (4 downto 0) := "01011";
constant m : std_logic_vector (4 downto 0) := "01100";
constant n : std_logic_vector (4 downto 0) := "01101";
constant o : std_logic_vector (4 downto 0) := "01110";
constant p : std_logic_vector (4 downto 0) := "01111";
constant q : std_logic_vector (4 downto 0) := "10000";
constant r : std_logic_vector (4 downto 0) := "10001";
constant s : std_logic_vector (4 downto 0) := "10010";
constant t : std_logic_vector (4 downto 0) := "10011";
constant u : std_logic_vector (4 downto 0) := "10100";
constant v : std_logic_vector (4 downto 0) := "10101";
constant w : std_logic_vector (4 downto 0) := "10110";
constant x : std_logic_vector (4 downto 0) := "10111";
constant y : std_logic_vector (4 downto 0) := "11000";
constant z : std_logic_vector (4 downto 0) := "11001";

begin

process (reflector_type,input_code)
begin

case reflector_type is 

when '0' => -- reflector B
case input_code is 

when a => output_code <= y;
when b => output_code <= r;
when c => output_code <= u;
when d => output_code <= h;
when e => output_code <= q;
when f => output_code <= s;
when g => output_code <= l;
when h => output_code <= d;
when i => output_code <= p;
when j => output_code <= x;
when k => output_code <= n;
when l => output_code <= g;
when m => output_code <= o;
when n => output_code <= k;
when o => output_code <= m;
when p => output_code <= i;
when q => output_code <= e;
when r => output_code <= b;
when s => output_code <= f;
when t => output_code <= z;
when u => output_code <= c;
when v => output_code <= w;
when w => output_code <= v;
when x => output_code <= j;
when y => output_code <= a;
when z => output_code <= t;
when others => output_code <= "00000";
end case; 

when '1' => -- reflector C 
case input_code is
when a => output_code <= f;
when b => output_code <= v;
when c => output_code <= p;
when d => output_code <= j;
when e => output_code <= i;
when f => output_code <= a;
when g => output_code <= o;
when h => output_code <= y;
when i => output_code <= e;
when j => output_code <= d;
when k => output_code <= r;
when l => output_code <= z;
when m => output_code <= x;
when n => output_code <= w;
when o => output_code <= g;
when p => output_code <= c;
when q => output_code <= t;
when r => output_code <= k;
when s => output_code <= u;
when t => output_code <= q;
when u => output_code <= s;
when v => output_code <= b;
when w => output_code <= n;
when x => output_code <= m;
when y => output_code <= h;
when z => output_code <= l;
when others => output_code <= "00000";
end case; 

when others => output_code <= "00000";
end case;
end process;
end behavior;