module udpDff (output Q,input D,input Clk,input Rst);
  reg Q;
  always @(posedge Clk or posedge Rst)begin
    if (!Rst) begin
    	Q = D;  
    end
    else begin
      Q = 0;
    end
  end
endmodule