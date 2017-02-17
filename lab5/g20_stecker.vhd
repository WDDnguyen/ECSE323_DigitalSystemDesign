library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity g20_stecker is 
port ( input_code : in std_logic_vector(4 downto 0);
		  output_code : out std_logic_vector(4 downto 0));
end g20_stecker;

architecture behavior of g20_stecker is 

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

process (input_code)

begin
case input_code is 

when a => output_code <= z;
when b => output_code <= y;
when c => output_code <= x;
when d => output_code <= w;
when e => output_code <= v;
when f => output_code <= u;
when g => output_code <= t;
when h => output_code <= s;
when i => output_code <= r;
when j => output_code <= q;
when k => output_code <= p;
when l => output_code <= o;
when m => output_code <= n;
when n => output_code <= m;
when o => output_code <= l;
when p => output_code <= k;
when q => output_code <= k;
when r => output_code <= i;
when s => output_code <= h;
when t => output_code <= g;
when u => output_code <= f;
when v => output_code <= e;
when w => output_code <= d;
when x => output_code <= c;
when y => output_code <= b;
when z => output_code <= a;

when others => output_code <= "00000";
end case;
end process;
end behavior;