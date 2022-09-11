module q1();
	reg [7:0] a,b,c,d;
	initial
	begin
	$dumpfile ("q1.vcd");
	$dumpvars (a,b,c,d, q1);
	
	$monitor (a,b,c,d);
	  #5 a=5;
	end
	initial
	begin
	//$dumpfile ("q1.vcd");
	//$dumpvars (a,b,c,d, q1);
	//$monitor (a,b,c,d);
	  #5 b = 10;
	  #5 c = 15;
	end
	initial
	begin
	//$dumpfile ("q1.vcd");
	//$dumpvars (a,b,c,d, q1);
	//$monitor (a,b,c,d);
	  #10 d = 20;
	end

	always @(posedge a[0])
		#5 $display("hello");
	always @(posedge b[1])
		#5 $display("hello");
	initial
		#10 $finish;
endmodule