# verilog-script
Useful verilog script

## Usage
    
    $ ./testbench.py -n [file name] -i [input ports] -o [output ports]
    
After writing the testbench, 
    
    $ ./compile.sh [file name]
    
### Example
    
    $ ./testbench.py -n ex_counter -i clk rst enable -o cnt
 
#### Testbench Output
    
    `timescale 1ps/1ps

    module ex_counter_tb;

        reg  [x : x] clk;
        reg  [x : x] rst;
        reg  [x : x] enable;

        wire [x : x] cnt;

        ex_counter inst1 (clk, rst, enable, cnt);

        initial begin
            $dumpfile("./vcd/ex_counter.vcd");
            $dumpvars(0, ex_counter_tb);
        end

        initial begin
            $display("clk\trst\tenable\tcnt");
            $monitor("%b\t%b\t%b\t%b", clk, rst, enable, cnt, $time);
        end

    endmodule
    
#### Writing Testbench

    /* ----- The part created by the [testbench.py] -----*/

    `timescale 1ps/1ps

    module ex_counter_tb;

        reg           clk;
        reg           rst;
        reg           enable;

        wire [15 : 0] cnt;

        ex_counter inst1 (clk, rst, enable, cnt);

    /* ----- The part created by the [testbench.py] -----*/

    /* ------ The part I wrote ------*/

        initial begin
            forever #5 clk = ~clk;
        end

        initial begin
            clk = 1;
            rst = 0;
            enable = 0;
        end

        initial begin
            #25     rst = 1;
            #10     rst = 0;
            #1000   rst = 1;
            #30     rst = 0;
        end

        initial begin
            #50     enable = 1;
            #100    enable = 0;
            #500    enable = 1;
         end

        initial begin
            #50000  $finish;
        end

    /* ------ The part I wrote ------*/

    /* ----- The part created by the [testbench.py] -----*/

        initial begin
            $dumpfile("./vcd/ex_counter.vcd");
            $dumpvars(0, ex_counter_tb);
        end

        initial begin
            $display("clk\trst\tenable\tcnt");
            $monitor("%b\t%b\t%b\t%b", clk, rst, enable, cnt, $time);
        end

    endmodule

    /* ----- The part created by the [testbench.py] -----*/
    
#### Compile

    $ ./compile.sh ex_counter
  
`compile.sh` runs the compiled file and shows the waveform.

