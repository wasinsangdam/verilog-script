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
