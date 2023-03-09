# Lab 5: Jakub Plachtička

### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 350 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![your figure](images/d_t_simulation.png)

### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture behavioral of jk_ff_rst is
signal sig_q : std_logic;
begin
    p_jk_ff_rst : process (clk) is
    begin
        if rising_edge(clk) then 
        if (rst = '1') then -- if reset is high then set outuput to low
            sig_q <= '0';
        elsif j = '1' and k = '0' then -- if j is high then set outuput to high
            sig_q <= '1';
        elsif j = '0' and k = '1' then -- if k is high then set outuput to low
            sig_q <= '0';    
        elsif j = '1' and k = '1' then --if both inputs are high then invert the output
            sig_q <= not(sig_q);   
        end if;
        end if;
    end process p_d_ff_rst;
    q     <= sig_q;
    q_bar <= not sig_q;
end architecture behavioral;
```

### Shift register

1. Image of `top` level schematic of the 4-bit shift register. Use four D-type flip-flops and connect them properly. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![your figure]()