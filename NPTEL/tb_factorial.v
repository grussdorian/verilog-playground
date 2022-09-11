module tb_factorial;
    reg [7:0] D_in;
    reg Clk, Start;
    wire Stop;
    wire [16:0] Rw;
    wire [7:0] Nw;
    wire [1:0] state;
    factorial_datapath DP(CN, LdN, LdR, Clr, DecN, D_in, Clk);
    factorial_ctrlpath CP(LdN, LdR, Clr, DecN, Stop, Clk, CN, Start);
    assign Rw = DP.Rw;
    assign Nw = DP.Nw;
    assign state = CP.state;

    initial begin
    Clk = 0;
    #3 Start = 1;
    #210 $finish;
    end
    
    always #5 Clk = ~Clk;
  

    initial begin
      #5 D_in = 8;
    end

    initial begin
    $dumpfile ("VCD/factorial.vcd"); // VCD file name
		$dumpvars (0, tb_factorial );  // Dumpvars to test waveform
    $monitor(" D_in = %d, Nw = %d, Rw = %d", D_in,DP.Nw , DP.Rw);
    end

endmodule