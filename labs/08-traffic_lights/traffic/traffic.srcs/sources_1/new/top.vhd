----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2023 12:01:24 PM
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


library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
entity top is
  port (
    CLK100MHZ   : in    std_logic;
    LED16_R     : out   std_logic;
    LED16_G     : out   std_logic;
    LED16_B     : out   std_logic;
    LED17_R     : out   std_logic;
    LED17_G     : out   std_logic;
    LED17_B     : out   std_logic;
    BTNC        : in    std_logic;
    SW          : in    std_logic_vector(1 downto 0)
  );
end entity top;

architecture behavioral of top is

begin
    ------------------------------------------------------
    -- Instance (copy) of tlc entity
    tlc : entity work.tlc
        port map(
            clk => CLK100MHZ,
            rst => BTNC,
            south(2) => LED16_R,
            south(1) => LED16_G,
            south(0) => LED16_B,
            west(2) => LED17_R,
            west(1) => LED17_G,
            west(0) => LED17_B
        );

end architecture behavioral;