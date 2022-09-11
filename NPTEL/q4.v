module q4();
	integer a,b;
	reg clk;
	always begin #5 clk = ~clk; #10 clk = ~clk; end
	initial
	begin
		$dumpfile ("q4.vcd");
		$dumpvars (a,b, q4);
		#2 clk = 1'b1; #5 a = 0; b = 1;
		#70 $finish;
	end
	always @(posedge clk ) a = a+b;
endmodule
