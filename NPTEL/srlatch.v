module srlatch(S,R,En,Q);
  input S,R,En;
  output reg Q;
  always @(*)
  begin
    if(En)
    begin
        if(S!=R)
             Q = S;
        else if (S==0 && R==0) Q = 1'bz;
    end
  end	
endmodule

module srlatch_4 (S, R, En, Q);   
    input [3:0]S;
    input [3:0]R;
    input En;
    output [3:0] Q;
    srlatch latch3(S[3],R[3],En,Q[3]);   
    srlatch latch2(S[2],R[2],En,Q[2]);  
    srlatch latch1(S[1],R[1],En,Q[1]);  
    srlatch latch0(S[0],R[0],En,Q[0]);  
endmodule