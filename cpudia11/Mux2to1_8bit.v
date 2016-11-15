module Mux2to1_8bit(i0,i1,sel,mux_out);

input [7:0]i0,i1;
input sel;
output [7:0]mux_out;

//assign mux_out = sel? i1 : i0;
assign mux_out = sel? i1 : i0;

endmodule 