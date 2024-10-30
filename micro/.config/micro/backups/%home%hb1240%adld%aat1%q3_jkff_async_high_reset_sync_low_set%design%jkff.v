
module jkff (
	input j, k, clk, rst, setlow,
	output reg q
);

always @ (posedge clk or posedge rst) begin
	if (rst) q <= 1'b0; // async active high reset
	else if (!setlow) q <= 1'b1; // sync active low set
	else begin
		case({j,k})
			2'b00: q <= q;    // Hold
			2'b01: q <= 1'b0; // Reset
			2'b10: q <= 1'b1; // Set
			2'b11: q <= ~q;   // Toggle
			default: q <= q;
		endcase
	end
end
endmodule
