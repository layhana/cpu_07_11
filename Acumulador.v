module Acumulador(dataIn, load, clock, dataOut);

	input [7:0] dataIn;
	input load, clock;
	output reg[7:0] dataOut;
	
	initial
	begin
		dataOut <= 8'h00;
	end
	
	always@(posedge clock)
	begin
		if(load)
			dataOut <= dataIn;
	end

endmodule
	