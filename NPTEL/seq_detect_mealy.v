module seq_detect_mealy
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2;  // FSM has 3 states
  reg [1:0] state, next_state; // To store 3 states, we need a 2 bit register called state

  always @(clr) begin
    if(clr==0) begin
      state = S0;
      next_state = S0;
    end
  end

  always @(posedge clk) begin // state change procedural block 
      // y = y_prev;
      state = next_state;
  end
  
  always @(x,state) begin  // State transition function T: State x Input_symbol -> State
    case (state)
      S0: begin
        if (x == 1'b0) next_state = S1;
        else if (x == 1'b1) next_state = S2;
        else next_state = S0;
      end
      
      S1: begin
        if (x == 1'b0) next_state = S1;
        else if (x == 1'b1) next_state = S2;
        else next_state = S1;
      end
      
      S2: begin
        if (x == 1'b0) next_state = S1;
        else if (x == 1'b1) next_state = S2;
        else next_state = S2;
      end
      
      default: begin
        state = S0;
        next_state = S0;
      end
    endcase
  end
  
  //In case of Mealy machine, an output is associated with a state transition
  always @(x,state) begin // Output function G: State -> Output Symbol, here 0 or 1
    case (state)
      S0: begin
        if(x == 0) y = 0;
        else y = 0;
      end

      S1: begin
        if(x==0) y = 1;
        else y = 0;
      end
  
      S2: begin
        if(x==0) y = 1;
        else y = 0;
      end
    endcase
  end
endmodule
