module seq_detect_moore 
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2;  // FSM has 3 states
  reg [1:0] state, next_state; // To store 4 states, we need a 2 bit register called state
  // reg y_prev;
//   initial $monitor("y = %b", y);
  initial y = 1'bz;

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
  always @(x,state) begin // Output function G: State x Input_symbol -> Output Symbol, here 0 or 1
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


/*
  always @(x) begin // Output function G: State x Input_symbol -> Output Symbol, here 0 or 1
    case (state)
      S0: begin
       y = 0;
      end

      S1: begin
        if(x==0) y = 1;
        else y = 0;
      end
  
      S2: begin
        if(x==0) y = 1;
        else y = 0;
      end
  
      S3: begin
        if(x==0) y = 1;
        else y = 0;
      end
    endcase
  end



  module seq_detect_mealy 
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;  // FSM has 4 states
  reg [1:0] state, next_state; // To store 4 states, we need a 2 bit register called state
  
  module seq_detect_mealy 
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;  // FSM has 4 states
  reg [1:0] state, next_state; // To store 4 states, we need a 2 bit register called state
  
  module seq_detect_mealy 
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;  // FSM has 4 states
  reg [1:0] state, next_state; // To store 4 states, we need a 2 bit register called state
  
  initial begin
    state = S0;
    next_state = S0;
  end
  
  always @(posedge clk, clr) begin // state change procedural block 
    if(clr==0) begin
      state = S0;
      next_state = S0;
    end
    else begin
      state = next_state;
    end
  end
  
  always @(state, x) begin  // State transition function T: State x Input_symbol -> State
    case (state)
      S0: begin
        if (x == 0)begin
          y=0; next_state = S1;
        end
        else if (x == 1)begin
          y=0; next_state = S3;
        end
        else next_state = S0;
      end
      
      S1: begin
        if (x == 0) begin
          y = 1;
          next_state = S2;
        end
        else if (x == 1) begin
          y = 0;
          next_state = S3;
        end
        else next_state = S1;
      end
      
      S2: begin
        if (x == 0) begin
          y = 1;
          next_state = S1;
        end
        else if (x == 1) begin
          y = 0;
          next_state = S3;
        end
        else next_state = S2;
      end
      
      S3: begin
        if (x == 0) begin
          y = 1;
          next_state = S2;
        end
        else if (x == 1) begin
          y = 0;
          next_state = S3;
        end
        else next_state = S3;
        // else next_state = S3;
      end
      
      default: begin
        state = S0;
        next_state = S0;
      end
    endcase
  end
  
  //In case of Mealy machine, an output is associated with a state transition

endmodule
  */

  /*

  module seq_detect_mealy 
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;  // FSM has 4 states
  reg [1:0] state, next_state; // To store 4 states, we need a 2 bit register called state
  
  initial begin
    state = S0;
    next_state = S0;
  end
  
  always @(posedge clk, clr) begin // state change procedural block 
    if(clr==0) begin
      state = S0;
      next_state = S0;
    end
    else begin
      state = next_state;
    end
  end
  
  always @(x) begin  // State transition function T: State x Input_symbol -> State
    case (state)
      S0: begin
        if (x == 0)begin
          y=0; next_state = S1;
        end
        else if (x == 1)begin
          y=0; next_state = S3;
        end
        else next_state = S0;
      end
      
      S1: begin
        if (x == 0) begin
          y = 1;
          next_state = S2;
        end
        else if (x == 1) begin
          y = 0;
          next_state = S3;
        end
        else next_state = S1;
      end
      
      S2: begin
        if (x == 0) begin
          y = 1;
          next_state = S1;
        end
        else if (x == 1) begin
          y = 0;
          next_state = S3;
        end
        else next_state = S2;
      end
      
      S3: begin
        if (x == 0) begin
          y = 1;
          next_state = S2;
        end
        else if (x == 1) begin
          y = 0;
          next_state = S3;
        end
        else next_state = S3;
        // else next_state = S3;
      end
      
      default: begin
        state = S0;
        next_state = S0;
      end
    endcase
  end
  
  //In case of Mealy machine, an output is associated with a state transition

endmodule


module seq_detect_moore
  (
    output reg y,   // output y, single bit
    input x,    // input x, single bit
    input clk,  // input clock signal
    input clr   // input clear, active low
  );

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;  // FSM has 4 states
  reg [1:0] state, next_state; // To store 4 states, we need a 2 bit register called state
  
//  initial $monitor($time," clk = %b x = %b y = %b state = %d next_state = %d, clr = %b", clk, x, y, state,next_state, clr);
//   initial $monitor("y = %b", y);
  always @(posedge clk, clr) begin // state change procedural block 
    if(clr==0) begin
      state = S0;
      next_state = S0;
    end
    else begin
      state = next_state;
    end
  end
  
  always @(x) begin  // State transition function T: State x Input_symbol -> State
    case (state)
      S0: begin
        if (x == 0) next_state = S1;
        else if (x == 1) next_state = S3;
        else next_state = S0;
      end
      
      S1: begin
        if (x == 0) next_state = S2;
        else if (x == 1) next_state = S3;
        else next_state = S1;
      end
      
      S2: begin
        if (x == 0) next_state = S1;
        else if (x == 1) next_state = S3;
        else next_state = S2;
      end
      
      S3: begin
        if (x == 0) next_state = S2;
        else if (x == 1) next_state = S3;
        else next_state = S3;
        // else next_state = S3;
      end
      
      default: begin
        state = S0;
        next_state = S0;
      end
    endcase
  end
  
  //In case of Mealy machine, an output is associated with a state transition
  always @(state) begin // Output function G: State x Input_symbol -> Output Symbol, here 0 or 1
    case (state)
      S0: y = 0;

      S1: y = 0;

      S2: y = 1;
      
      S3: y = 0;
     
    endcase
  end
endmodule
*/
