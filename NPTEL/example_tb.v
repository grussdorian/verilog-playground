module example_tb;
reg t_x, t_y;
wire t_z;
example_ckt ckt ( t_z, t_x, t_y );
initial begin
$dumpfile ("example_ckt.vcd");
$dumpvars (0, example_tb);
$monitor (t_x, t_y, t_z);
t_x = 1'b0; t_y= 1'b0;
#5 t_x = 1'b0; t_y= 1'b1;
#5 t_x = 1'b1; t_y= 1'b0;
#5 t_x = 1'b1; t_y= 1'b1;
end
endmodule
