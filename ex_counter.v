/* Simple 16-bit counter */

module ex_counter (
    input   wire            clk,
    input   wire            rst,
    input   wire            enable,

    output  reg [15 : 0]    cnt
);

    always @(posedge clk) begin
        if      (rst)    cnt <= 16'd0;
        else if (enable) cnt <= cnt + 1;
        else             cnt <= cnt;
    end

endmodule