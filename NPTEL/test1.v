module seq_detect_moore 
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2;  // FSM has 3 states
  reg [1:0] state, next_state; // To store 3 states, we need a 2 bit registers  

  always @(clr) begin
    if(clr==0) begin
      state <= S0;
      next_state <= S0;
    end
  end

  always @(posedge clk)begin
    state <= next_state;
  end

  always @(x,state)begin
    case (state)
      S0: begin
        if( x == 0 ) begin
          y = 0;
          next_state = S1;
        end
        else begin
          y = 0 ;
          next_state = S2;
        end
      end
      S1: begin
        if( x == 0 ) begin
          y = 1;
          next_state = S1;
        end
        else begin
          y = 0 ;
          next_state = S2;
        end
      end
      S2: begin
        if( x == 0 ) begin
          y = 1;
          next_state = S1;
        end
        else begin
          y = 0 ;
          next_state = S2;
        end
      end
      default: begin 
        y = 0;
        next_state = S0;
      end
    endcase
  end

endmodule
