module q3();
	integer a,b;
	reg clk;
	always #5 clk = ~clk;
	initial
	begin
		$dumpfile ("q3.vcd");
		$dumpvars (a,b, q3);
		#2 clk = 1'b1; #5 a = 0; b = 1;
		#70 $finish;
	end
	always @(posedge clk ) a = a+b;
endmodule
