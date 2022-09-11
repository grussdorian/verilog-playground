module tb_seq_detect;
    wire y;
    reg x,clk,clr;
    seq_detect_mealy sq(y,x,clk,clr);
    wire state, next_state;
    assign state = sq.state;
    assign next_state = sq.next_state;
    initial begin 
      clr = 0; clk = 0;
      #5 clr = 1;
      #50 $finish;
    end
    
    initial begin
    $dumpfile ("VCD/seq_detect_mealey.vcd"); // VCD file name
		$dumpvars (0, tb_seq_detect );  // Dumpvars to test waveform
    $monitor($time," clk = %b x = %b y = %b state = %d next_state = %d, clr = %b", clk, x, y, sq.state, sq.next_state, clr);
    //  $monitor("y = %b", y);
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
    end
    
    always #5 clk = !clk;
endmodule