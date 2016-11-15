module ULA (a, b, opcode, aluOut);

	input [7:0] a;
	input [7:0] b;
	input [3:0] opcode;
	output reg [7:0] aluOut;
	
	always@(opcode, a, b)
	begin
		case (opcode)
			4'b0000:
				aluOut = 0;
			4'b0001:
				aluOut = a + b;
			4'b0010:
				aluOut = a - b;
			4'b0011:
				aluOut = a * b;
			4'b0100:
				aluOut = a / b;
			4'b0101:
				aluOut = a & b;
			4'b0110:
				aluOut = a | b;
			4'b0111:
				aluOut = ~a;
			4'b1000:
				aluOut = a ^ b;
			4'b1001:
				aluOut = a ~^ b;
			4'b1010:
				aluOut = a; // Armazena o conteudo de a na saida da ULA
			4'b1011:
				aluOut = ~a;
		
		endcase
	end

endmodule
