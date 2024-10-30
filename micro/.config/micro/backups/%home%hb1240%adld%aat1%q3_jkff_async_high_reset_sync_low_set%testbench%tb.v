
module tb;
reg j, k, clk, rst, setlow;
wire q;

jkff uut (j, k, clk, rst, setlow, q);

initial begin
	$dumpfile("waveform.vcd");
	$dumpvars(0, tb);

	rst=1'b1;
	setlow=1'b1;
	#1 rst=1'b0;
	#6 setlow=1'b0;
	#4 setlow=1'b1;
	#10 rst=1'b1;
	#1 rst=1'b0;

end

always #5 clk = ~clk;

initial begin 
  clk=1'b1;
  j=1'b0; k=1'b0; #10;
  j=1'b0; k=1'b1; #10;
  j=1'b1; k=1'b0; #10;
  j=1'b1; k=1'b1; #10;
  $finish;
end

endmodule
