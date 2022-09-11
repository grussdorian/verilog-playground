module factorial_datapath (CN, LdN, LdR, Clr, DecN, D_in, Clk);

  input LdN, LdR, DecN, Clr, Clk;
  output CN;
  input [7:0] D_in;
  wire [15:0] Rw, mul_out;
  wire [7:0] Nw;
  wire [7:0] d;

  assign d = D_in + 1;
  // initial d

  PIPO1 reg_R(Clk, LdR, Clr, mul_out, Rw);
  PIPO2 reg_N(Clk, LdN, Clr, DecN, d, Nw);
  MUL m(Nw, Rw, mul_out);
  comparator c(Nw,CN);

endmodule

module factorial_ctrlpath (LdN, LdR, Clr, DecN, Stop, Clk, CN, Start);
  
  output reg LdN, LdR, DecN, Clr, Stop;
  input Clk, CN, Start;
  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3; // FSM has 5 states
  reg [1:0] state;

  always @(posedge Clk) begin
    case (state)

      S0: if(Start) state <= S1;

      S1: state <= S2;

      S2: #2 if(CN) state <= S3;

      S3: state <= S3;

      default: state <= S0;

    endcase

  end

  always @(state) begin
    case (state)

      S0: begin #1 LdN = 0; LdR = 0; Clr = 1; DecN = 0; Stop = 0; end
 
      S1: begin #1 LdN = 1; LdR = 0; Clr = 0; DecN = 0; Stop = 0; end

      S2: begin #1 LdN = 0; LdR = 1; Clr = 0; DecN = 1; Stop = 0; end

      S3: begin #1 LdN = 0; LdR = 0; Clr = 0; DecN = 0; Stop = 1; end

      default: begin #1 LdN = 0; LdR = 0; Clr = 0; DecN = 0; Stop = 0; end
    endcase
  end

endmodule

module comparator(N,CN);
  input [7:0] N;
  output CN;
  assign CN = (N>1)?0:1;
endmodule

module PIPO2(Clk,LdN,Clr, DecN, N, Nw);
  input Clk, LdN, Clr, DecN;
  input [7:0] N;
  output reg [7:0] Nw;

  always @(posedge Clk) begin
    if(LdN) Nw <= N;
  end

  always @(negedge Clk) begin
    if(Clr) Nw <= 0;
    else if (DecN) Nw <= Nw - 1;
  end

endmodule

module PIPO1(Clk, LdR, Clr, R, Rw);
  input Clk, Clr, LdR;
  input [15:0] R;
  output reg [15:0] Rw;

  always @(posedge Clk) begin
    if(LdR) Rw <= R;
  end
  always @(negedge Clk) begin
    if(Clr) Rw <= 1;
  end
endmodule

module MUL(N, R, mul_out);
  input [7:0] N;
  input [15:0] R;
  output reg [15:0] mul_out;
  
  always @(*)
    mul_out = N * R;

endmodule