module ContadorDePrograma (dataIn, reset, clock, dataOut);

	input [3:0] dataIn;
	input	reset, clock;
	output reg [3:0] dataOut;
	
	always@(posedge clock)
	begin
		if(reset)
			dataOut <= 4'b0000;
		else
			dataOut <= dataIn;
	end
	
endmodule
	