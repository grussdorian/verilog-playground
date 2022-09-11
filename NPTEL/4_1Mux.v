module mux4x1 (input [3:0] in, input [1:0] sel, output out);
    wire [1:0] sel_bar;
    wire [3:0] t;
    integer a,b,c,d;
    not n1(sel_bar[0],sel[0]) , n2(sel_bar[1],sel[1]);
    and a3 (t[3], sel[1],sel[0], in[3]), a2 (t[2], sel[1],sel_bar[0], in[2]),
    a1(t[1], sel_bar[1],sel[0], in[1]), a0(t[0], sel_bar[1],sel_bar[0], in[0]);
    or(out, t[3],t[2],t[1],t[0]);
endmodule

module bus_multiplexer (D3, D2, D1, D0, SEL, DBUS);
    parameter N = 16;
    input [N-1:0] D3,D2,D1,D0;
    input [1:0] SEL;
    output [N-1:0] DBUS;

    genvar i;
    generate for (i=0;i<N;i=i+1) 
        begin
            mux4x1 m1 ( {D3[i],D2[i],D1[i],D0[i]} , {SEL[1], SEL[0]}, DBUS[i]);
        end
    endgenerate
endmodule  