module tb_MUL;
    wire [7:0] N;
    wire [15:0] R, mul_out;

    assign N = 4;
    assign R = 1680;
    // reg x,clk,clr;
    MUL m(N,R,mul_out);
    
    initial begin
    // $dumpfile ("VCD/seq_detect_mealey.vcd"); // VCD file name
		// $dumpvars (0, tb_seq_detect );  // Dumpvars to test waveform
    $monitor(" N = %d, R = %d, mul_out = %d", N,R,mul_out);
    end
  
endmodule