module tb_pipeline_adder;
    wire [3:0] sum;
    wire cout;
    reg [3:0] a,b;
    wire [8:0] S;
    reg cin;
    rca_adder rca(sum,cout,a,b,cin);
    integer i;
    assign  S = {cout, sum};
    initial begin
      for(i=0;i<512;i=i+1) begin
        #2 {cin,b,a} = i;
      end
    end
    
    initial begin
    // $dumpfile ("VCD/seq_detect_mealey.vcd"); // VCD file name
		// $dumpvars (0, tb_seq_detect );  // Dumpvars to test waveform
    $monitor(" a = %d, b = %d, cin = %d, sum = %d, cout = %d, S = %d",a,b,cin,sum,cout, S);

    end

  
endmodule