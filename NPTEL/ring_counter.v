module udpDff (output Q,input D,input Clk,input Rst);
  reg Q;
  always @(posedge Clk, Rst)begin
    if (!Rst) begin
    	Q = D;  
    end
    else begin
      Q = 0;
    end
  end
endmodule

module ring_counter16( Out,  In, Clk, Ld, Clr);
  output reg [15:0] Out;
  input  [15:0] In;
  input Clr,Clk,Ld;
  integer i;
  reg [15:0] DFF_i;
  wire [15:0] DFF_o;
 
  udpDff dff [15:0] (DFF_o, DFF_i, Clk, Clr);

  initial
  begin
    DFF_i[i] = 16'hffff;
    Out = 16'hffff;
  end
  
  initial begin
  end
  
  always @(DFF_i)
  begin
    Out <= DFF_i;
  end
  always @(posedge Clk or posedge Clr)
  begin
    if (Clr)  DFF_i <= 16'h0000;
    
    else begin
        if(Ld == 1) begin
            for(i=0; i<16; i=i+1) begin
                Out[i] <= In[i];
                DFF_i[i] <= In[i];
            end
        end
        else begin
            for(i=0;i<16;i=i+1) begin
                DFF_i[i] <= DFF_i[(i+1)%16];
            end
        end
    
    end
  end
endmodule
