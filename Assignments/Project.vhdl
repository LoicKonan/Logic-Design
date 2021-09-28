library ieee;
use ieee.std_logic_1164.all;
entity reg is   
port ( ck : 	in std_logic;
		 enable:	 in std_logic;
		 rin:	 in std_logic_vector (3 downto 0);
		 rout:	 out std_logic_vector (3 downto 0));
end entity;
architecture r of reg is
signal rt: std_logic_vector (3 downto 0);
begin
	process (ck)
	begin
	   if (rising_edge(ck)) then
			if (enable = '1') then
		            	rt <= rin;
			end if;
	   end if;
	end process;
	rout <= rt;
end r;

-- MUXLDMV SELECTS DATA TO GO TO REGISTERS 0 AND 1 FROM lOAD OR MOVE

library ieee;
use ieee.std_logic_1164.all;
entity muxLDMV is   
port ( selct:	 in std_logic;
		 ldvalue, mvvalue:	 in std_logic_vector (3 downto 0);
		 muxout:	 out std_logic_vector (3 downto 0));
end entity;
architecture sel of muxLDMV is
begin
	process (selct,mvvalue,ldvalue)
	begin
	   if (selct = '1') then
		    muxout <= mvvalue;
		else
			 muxout <= ldvalue;
	   end if;
	end process;
end sel;

-- MUXASAO SELECTS DATA TO GO TO REGISTER 2 FROM ADD, SUB, AND, OR
library ieee;
use ieee.std_logic_1164.all;entity muxASAO is   
port ( selct:	 in std_logic_vector (2 downto 0);
		 advalue, sbvalue,anvalue,orvalue,nevalue:	 in std_logic_vector (3 downto 0);
		 muxout:	 out std_logic_vector (3 downto 0));
end entity;
architecture sel4 of muxASAO is
begin
	process (selct,advalue, sbvalue, anvalue, orvalue,nevalue)
	begin
	   case selct is
		when B"001" => muxout <= advalue;
		when B"010" => muxout <= anvalue;
		when B"011" => muxout <= orvalue;
		when B"101" => muxout <= sbvalue;
		when B"111" => muxout <= nevalue;
		when others => muxout <= "0000";
	   end case;
	end process;
end sel4;

-- NOT OPERATION 
library ieee;
use ieee.std_logic_1164.all;
entity nega is   
port ( selct:	 in std_logic_vector (3 downto 0);
		 r0value, r1value:	 in std_logic_vector (3 downto 0);
		 negout:	 out std_logic_vector (3 downto 0));
end entity;
architecture sel1 of nega is
begin
	process (selct,r0value, r1value)
	begin
	   case selct is
		when B"1111" => negout <= not r1value;
		when B"1110" => negout <= not r0value;
		when others => negout <= "0000";
	   end case;
	end process;
end sel1;
-- DISPLAY SELECTS BETWEEN R0,R1 AND R2
library ieee;
use ieee.std_logic_1164.all;
entity display is   
port ( selct:	 in std_logic_vector (3 downto 0);
		 r0, r1, r2:	 in std_logic_vector (3 downto 0);
		 rout:	 out std_logic_vector (3 downto 0));
end entity;
architecture d of display is
begin
	process (selct,r0,r1,r2)
	begin
   case selct is
		when B"1100" => rout <= r0;
		when B"1101" => rout <= r1;
		when others => rout <= r2;
	end case;
	end process;
end d;


-- ORIGINAL SUBMITTED CODE
------- and entity ---
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity And_S is 
port(
A : in STD_LOGIC_VECTOR(3 downto 0);
B : in STD_LOGIC_VECTOR(3 downto 0);
X : out STD_LOGIC_VECTOR(3 downto 0));
end entity;
------ architecture of and ---
---- and_f is a variable name can be changed
architecture and_f of And_S is 
begin	
---  a and b need to have the same bits to be passed on to r2
	x <= A and B;
end and_f;




------ entity or ------
library ieee;
use ieee.std_logic_1164.all;
entity or_s is
port(
A : in STD_LOGIC_VECTOR(3 downto 0);
B : in STD_LOGIC_VECTOR(3 downto 0);
X : out STD_LOGIC_VECTOR(3 downto 0)
);
end entity;



---- architecture of or ----
-------or_f as variable name ---
architecture or_f of or_s is
begin
	x <= A or B;
end or_f;






--- subtract entity 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity projectsub is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0) := "0000";
           B : in  STD_LOGIC_VECTOR (3 downto 0) := "0000";
           X : out  STD_LOGIC_VECTOR (3 downto 0));
end projectsub;

architecture Behavioral of projectsub is
begin

    X <= A - B;

end Behavioral;

-------- add entity
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity binary_4_bit_adder_top is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0) := "0000";
           B : in  STD_LOGIC_VECTOR (3 downto 0) := "0000";
           X : out  STD_LOGIC_VECTOR (3 downto 0));
end binary_4_bit_adder_top;

architecture Behavioral of binary_4_bit_adder_top is
begin

    X <= A + B;

end Behavioral;




------- project entity -------
library ieee;
use ieee.std_logic_1164.all;
entity PROJECT is
port(
   instruction : in std_LOGIC_VECTOR (7 downto 0);
	--maybe signal command : in std_LOGIC_VECTOR (3 downto 0);
	exe : in std_LOGIC;
	--upd : in std_LOGIC;
	mainout: out std_LOGIC_VECTOR (3 downto 0) ---- this out r2 then will be displayed 
	

);
end entity;


architecture behavior of Project is

 ----- this is calling the Addition entity defined outside the project entity//
component binary_4_bit_adder_top --Addition IS A WRONG NAME
Port 
(
	A : in std_logic_vector(3 downto 0);	
	B : in std_logic_vector(3 downto 0);
	X : out std_logic_vector(3 downto 0));
end component;

--or components--
component or_s
port
(
A : in std_logic_vector(3 downto 0);
B : in std_logic_vector(3 downto 0);
X : out std_logic_vector(3 downto 0));
end component;


--component for and s
component And_S 
port
(
A : in std_logic_vector(3 downto 0);
B : in std_logic_vector(3 downto 0);
X : out std_logic_vector(3 downto 0));
end component;

---subtract compents ----
component projectsub
port
(
---- r0 and r1 bits go in and out to r2
A : in std_logic_vector(3 downto 0);
B : in std_logic_vector(3 downto 0);
X : out std_logic_vector(3 downto 0)
);
end component;

---need component registers---call one compoent
--inside architecture of project call 3 times

component reg is   port 
(
ck : in std_logic;
enable:in std_logic;
rin:in std_logic_vector(3 downto 0);
rout:out std_logic_vector(3 downto 0));
end component;

-
--MUXES
component muxLDMV is   
port ( selct:	 in std_logic;
		 ldvalue, mvvalue:	 in std_logic_vector (3 downto 0);
		 muxout:	 out std_logic_vector (3 downto 0));
end component;


component muxASAO IS port ( selct:	 in std_logic_vector (2 downto 0);
		 advalue, sbvalue,anvalue,orvalue, nevalue:	 in std_logic_vector (3 downto 0);
		 muxout:	 out std_logic_vector (3 downto 0));
end component;

-- NOT OPERATION 
component nega is   
port ( selct:	 in std_logic_vector (3 downto 0);
		 r0value, r1value:	 in std_logic_vector (3 downto 0);
		 negout:	 out std_logic_vector (3 downto 0));
end component;

-- DISPLAY 
component display is   
port ( selct:	 in std_logic_vector (3 downto 0);
		 r0, r1, r2:	 in std_logic_vector (3 downto 0);
		 rout:	 out std_logic_vector (3 downto 0));
end component;

--CLOCK IS DECLARED AS EXE IN THE PROJECT ENTITY
--enable the loader
--signal ck:STD_LOGIC;
--signal enLD: STD_LOGIC;

--- VECTORS INCLUDE THEIR SIZES
--sginal for all the other components--
signal Subout:STD_LOGIC_VECTOR(3 downto 0);
signal Adout:STD_LOGIC_VECTOR(3 downto 0);
signal Muxout:STD_LOGIC_Vector(3 downto 0);
--signal And_S:STD_LOGIC;
--signal or_s: std_logic;
--signal reg1:STD_LOGIC;
signal R0: STD_LOGIC_Vector(3 downto 0);
signal R1: STD_LOGIC_Vector(3 downto 0);
signal R2: STD_LOGIC_Vector(3 downto 0);

--SIGNALS ADDED BY PASSOS
signal Muxout2:STD_LOGIC_Vector(3 downto 0);
signal Andout:STD_LOGIC_Vector(3 downto 0);
signal ORout:STD_LOGIC_Vector(3 downto 0);
signal Negout:STD_LOGIC_Vector(3 downto 0);
signal enLDR0, enLDR1, enLDR2: STD_LOGIC;
--DISCARDED INSTRUCTION, CONFLICTS WITH LABEL USED BELOW
--signal register_0: STD_LOGIC;

begin

--enable the load of the first three bits of instruction
--IDENTIFIES THE INSTRUCTIONS LOAD/MOVE (ONLY ONES WITH 00 IN BITS 5,6) AND REGISTER 0/1
enLDR0<= (not instruction(6))and(not instruction(5)) and(not instruction(4));
enLDR1<= (not instruction(6))and(not instruction(5)) and instruction(4);

--IDENTIFIES THE INSTRUCTIONS THAT RESULT IN R2, NOT LOAD AND NOT MOVE AND NOT DISPKLAY
enLDR2<= (not enLDR0)and (not enLDR1)and (not (instruction(7) and (not instruction(5))));

-- ADDED BTY PASSOS MUX SELECTING MOVE OR LOAD (instr 7 does that)
whichdata: muxLDMV port map (instruction (7),instruction(3 downto 0), R2, muxout);

register_0:reg 	port map (exe,enLDR0,Muxout,R0);

-- ADDED TWO REGISTERS 1 AND 2
register_1:reg 	port map (exe,enLDR1,Muxout,R1);

-- Muxout2 COMES FROM FUNCTIONAL UNITS - ADD/SUB/OR/AND
register_2:reg 	port map (exe,enLDR2,Muxout2,R2);

Addition: binary_4_bit_adder_top --Addition 
	port map(R0,R1,Adout);

Subtract: projectsub 	port map(R0,R1,Subout);


And_SL:And_S 	port map(R0, R1,Andout);
 
 
--- don't need r0 => r0
or_sL:or_s 	port map(r0, r1,ORout);

negate:nega 	port map(instruction(7 downto 4), R0, R1,Negout);

whichop: muxASAO port map ( instruction(7 downto 5), Adout, Subout, Andout, ORout, Negout, Muxout2);
displwho: display port map (instruction (7 downto 4), R0, R1, R2, mainout);


end;
--