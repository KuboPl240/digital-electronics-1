----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2023 11:34:54 AM
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
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

architecture behavioral of top is
  -- No internal signals are needed today:)
begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_8digits entity
  --------------------------------------------------------
  driver_seg_4 : entity work.driver_7seg_4digits
      port map (
          clk      => CLK100MHZ,
          rst      => BTNC,
          
          data7(3) => SW(15),
          data7(2) => SW(14),
          data7(1) => SW(13),
          data7(0) => SW(12),

          data6(3) => SW(11),
          data6(2) => SW(10),
          data6(1) => SW(9),
          data6(0) => SW(8),
         
          data5(3) => SW(7),
          data5(2) => SW(6),
          data5(1) => SW(5),
          data5(0) => SW(4),

          data4(3) => SW(3),
          data4(2) => SW(2),
          data4(1) => SW(1),
          data4(0) => SW(0),
          
          data3(3) => SW(15),
          data3(2) => SW(14),
          data3(1) => SW(13),
          data3(0) => SW(12),


          data2(3) => SW(11),
          data2(2) => SW(10),
          data2(1) => SW(9),
          data2(0) => SW(8),
         
          data1(3) => SW(7),
          data1(2) => SW(6),
          data1(1) => SW(5),
          data1(0) => SW(4),

          data0(3) => SW(3),
          data0(2) => SW(2),
          data0(1) => SW(1),
          data0(0) => SW(0),
          
          seg(6) => CA,
          seg(5) => CB,
          seg(4) => CC,
          seg(3) => CD,
          seg(2) => CE,
          seg(1) => CF,
          seg(0) => CG,


          -- DECIMAL POINT
          dp_vect => "01111111",
          dp      => DP,

          -- DIGITS
          dig => AN
      );

  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Disconnect the top four digits of the 7-segment display
  --AN(7 downto 4) <= b"1111";

end architecture behavioral;
