module pipe_adder(sum, cout, a, b, cin, clk);
input clk;
input [15:0] a,b;
input cin;
output [15:0] sum;
output  cout;

wire [2:0] c;
wire [15:0] s;
reg [3:0] r1,r2,r3;
reg[3:0] s1,s2,s3,s4;
reg[3:0] t1,t2,t3,t4,t5;
reg[3:0] u1,u2,u3,u4,u5,u6;
reg a1,a2,a3;


rca_adder RCA1(
.a(a[3:0]), 
.b(b[3:0]), 
.cin(cin),
.sum(s[3:0]),
.cout(c[0]));

rca_adder RCA2(
.a(s1),
.b(s2), 
.cin(a1), 
.sum(s[7:4]),
 .cout(c[1]));

rca_adder RCA3(
.a(t3),
 .b(t4), 
.cin(a2),
 .sum(s[11:8]),
 .cout(c[2]));

rca_adder RCA4(
.a(u5),
 .b(u6), 
.cin(a3),
 .sum(sum[15:12]),
 .cout(cout));


  always @(posedge clk)
  begin

  //1st level
         r1<=s[3:0];
         r2<=r1;
         r3<=r1;


  //2nd Level 	
        s1<=a[7:4];
        s2<=b[7:4];
        a1<=c[0];
        s3<=s[7:4];
        s4<=s3;

  //3rd Level 
       t1<=a[11:8];
       t2<=b[11:8];
       t3<=t1;
       t4<=t2;
       a2<=c[1];
       t5<=s[11:8];

  //4th Level
       u1<=a[15:12];
       u2<=b[15:12];
       u3<=u1;
       u4<=u2;
       u5<=u3;
       u6<=u4;
       a3<=c[2];
  end
  
assign  sum[3:0]=r3;
assign  sum[7:4]=s4;
assign  sum[11:8]=t5;
endmodule

module full_adder (sum,cout,a,b,cin);
  input a,b,cin;
  output sum,cout;
  wire t1,t2,t3;
  xor(sum,a,b,cin);
  and(t1,a,cin);
  and(t2,b,cin);
  and(t3,a,b);
  or(cout,t1,t2,t3);
endmodule

module rca_adder (sum, cout, a, b, cin);
  input [3:0] a,b;
  input cin;
  output [3:0] sum;
  output cout;
  wire t0,t1,t2;

  full_adder fa0(sum[0],t0,a[0],b[0],cin);
  full_adder fa1(sum[1],t1,a[1],b[1],t0);
  full_adder fa2(sum[2],t2,a[2],b[2],t1);
  full_adder fa3(sum[3],cout,a[3],b[3],t2);

endmodule