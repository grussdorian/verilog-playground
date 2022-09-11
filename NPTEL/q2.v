module q2();
	reg [7:0] a,b,c,d;
	initial
	begin
		$dumpfile ("q2.vcd");
		$dumpvars (a,b,c,d, q2);
		#5 a = 5; b=6; d=7; c=8;
		#5 a =4; b=a; c= b; d=c;
	end
endmodule
