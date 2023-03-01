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
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_comparator_4bit is
  -- Entity of testbench is always empty
end entity tb_comparator_4bit;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_comparator_4bit is

  -- Testbench local signals
  signal sa_i           : std_logic_vector(2 downto 0);
  signal sb_i           : std_logic_vector(2 downto 0);
  signal sc_i           : std_logic_vector(2 downto 0);
  signal sd_i           : std_logic_vector(2 downto 0);
  signal ssel_i         : std_logic_vector(1 downto 0);
  signal sy_o           : std_logic_vector(2 downto 0);

begin

  -- Connecting testbench signals with comparator_4bit
  -- entity (Unit Under Test)
  uut_comparator_4bit : entity work.comparator_4bit
    port map (
      a_i           => sa_i,
      b_i           => sb_i,
      c_i           => sc_i,
      d_i           => sd_i,
      sel_i        => ssel_i,
      y_o           => sy_o
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    -- First test case ...
    sa_i <= "010";
    ssel_i <= "00";
    wait for 100 ns;
    -- ... and its expected outputs
    assert (
            (sy_o = "010")
        )
      -- If false, then report an error
      -- If true, then do not report anything
      report "FAILED"
      severity error;

    ------------------------------
    -- WRITE OTHER TEST CASES HERE
    sc_i <= "110";
    ssel_i <= "10";
    wait for 100 ns;
    assert (
               (sy_o = "110")                     
        )
      report " FAILED"
      severity error;



    -- Report a note at the end of stimulus process
    report "Stimulus process finished";

    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end architecture testbench;

