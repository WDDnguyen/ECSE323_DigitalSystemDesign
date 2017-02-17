-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"
-- CREATED		"Wed Jan 20 14:16:23 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g20_Comp6 IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
		AeqB :  OUT  STD_LOGIC
	);
END g20_Comp6;

ARCHITECTURE bdf_type OF g20_Comp6 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_2 <= NOT(A(0) XOR B(0));


SYNTHESIZED_WIRE_3 <= NOT(A(1) XOR B(1));


AeqB <= SYNTHESIZED_WIRE_0 AND SYNTHESIZED_WIRE_1;


SYNTHESIZED_WIRE_0 <= SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_4 <= NOT(A(2) XOR B(2));


SYNTHESIZED_WIRE_5 <= NOT(A(3) XOR B(3));


SYNTHESIZED_WIRE_6 <= NOT(A(4) XOR B(4));


SYNTHESIZED_WIRE_7 <= NOT(A(5) XOR B(5));


SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_6 AND SYNTHESIZED_WIRE_7;


END bdf_type;