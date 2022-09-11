module latchtest;
    reg S, R, En; wire Q;
    srlatch_4 LAT(S[3:0],R[3:0],En,Q[3:0]);
    initial
    begin
        $monitor ($time , " En=%b S=%b R=%b, Q=%b",
        En, S, R, Q);
        // $dumpfile ("q4.vcd");
		// $dumpvars (a,b, q4);
        // En =1'b1;
        //En =1'b1;
           En = 1'b1; S = 4'hf; R = 4'hf;
        //En =1'b0;
        #5 En = 1'b1; S = 4'hf; R = 4'h0;
        //En =1'b1;
        #5 En = 1'b0; S = 4'h0; R = 4'hf;
        //En =1'b0;
        #5 En = 1'b1; S = 4'h0; R = 4'hf;
        //En =1'b1;
    end
endmodule