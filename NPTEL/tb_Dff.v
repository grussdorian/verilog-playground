module tb_Dff;  // change module name
    parameter clock_period = 5;
    parameter end_time = 100;
    reg D,Clk,Rst; wire Q;   // Declare all inputs to DUT as reg and output as wire
    udpDff dff(Q,D,Clk,Rst);  // instantiate DUT as <modulename> <instance-name>(size[wid:th])
    reg [1:0] R;
    initial
    begin
        $monitor ($time , " Q=%b, D=%d, Clk=%d, Rst=%b", // monitor
        Q, D, Clk, Rst);
        $dumpfile ("VCD/Dff.vcd"); // VCD file name
		$dumpvars (0, tb_Dff );  // Dumpvars to test waveform
        // En =1'b1;
        //En =1'b1;
        // #clock_period $display("started");  // phase shift of clock by half cycle

        // #clock_period D = 1'b1;  Rst = 1'b1;
        // //En =1'b0;
        // #clock_period D = 1'b1;  Rst = 1'b1;
        // //En =1'b1;
        // #clock_period D = 1'b1;  Rst = 1'b0;
        // //En =1'b0;
        // #clock_period D = 1'b1;  Rst = 1'b0;
        //En =1'b1;
    end

    always @(negedge Clk) begin

        #2 R = $random %2;
        D = R[0];
        Rst = R[1]; 
    end
    initial Clk = 1'b0;

    always #clock_period Clk = ~Clk;

    initial #end_time $finish;
endmodule