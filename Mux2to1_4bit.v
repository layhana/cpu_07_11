module Mux2to1_4bit(i0,i1,sel,mux_out);

input [3:0]i0,i1;
input sel;
output [3:0]mux_out;

assign mux_out = sel? i1 : i0;

endmodule 