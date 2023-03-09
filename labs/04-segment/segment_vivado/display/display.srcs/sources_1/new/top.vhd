----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2023 11:57:44 AM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

architecture Behavioral of top is

begin
  hex2seg : entity work.hex_7seg
    port map (
      blank  => BTNC,
      hex    => SW,
      seg(6) => CA,
      seg(5) => CB,
      seg(4) => CC,
      seg(3) => CD,
      seg(2) => CE,
      seg(1) => CF,
      seg(0) => CG
    );

  -- Connect one common anode to 3.3V
  AN <= b"0111_1111";

  -- Display input value on LEDs
  LED(3 downto 0) <= SW;
  
  LED(4)<= '1' when (SW = "0000")
  else '0';
  
  LED(5)<= '1' when (SW > "1001")
  else '0';
  
  LED(6)<= '1' when (SW(0 )='0')
  else '0';
  
 LED(7)<= '1' when (SW = "0001") else
          '1' when (SW = "0010") else
          '1' when (SW = "0100") else
          '1' when (SW = "1000") else
          '0';   

  
  
end Behavioral;
