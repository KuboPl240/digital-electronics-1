----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2023 12:06:25 PM
-- Design Name: 
-- Module Name: mux_3bit_4to1 - Behavioral
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

------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------

entity comparator_4bit is
  port (
    a_i           : in    std_logic_vector(2 downto 0); 
    b_i           : in    std_logic_vector(2 downto 0); 
    c_i           : in    std_logic_vector(2 downto 0);  
    d_i           : in    std_logic_vector(2 downto 0);                
    sel_i         : in    std_logic_vector(1 downto 0);                    
    y_o           : out   std_logic_vector(2 downto 0)                 
  );
end entity comparator_4bit;

------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------

architecture behavioral of comparator_4bit is

begin
    y_o <= a_i when(sel_i = "00")else
           b_i when(sel_i = "01")else
           c_i when(sel_i = "10")else
           d_i when(sel_i = "11");
    
end architecture behavioral;
