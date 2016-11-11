module IncrementodoContador(a,b,adder_out);

input [3:0]a;
input [3:0]b;
output [3:0]adder_out;

assign adder_out = a + b;

endmodule 