module tb4;
reg clk, rst;
wire [2:0] q;

async_async_rst uut (clk, rst, q);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb4);
    rst = 1; clk = 1;
    #1 rst = 0;
    #99 $finish;
end

always #5 clk = ~clk;

endmodule
