module CaminhoDeDados (reset, ld_ac, ac_src, pc_src, clock,
	opcode, instMemAddrBus, instMemDataBus,
	dataMemAddrBus, dataMemInDataBus, dataMemOutDataBus,
	acOut, aluOut, LEDR, LEDG);

	// DataPath
	
	input reset, ld_ac, ac_src, pc_src, clock;
	output [3:0] opcode;
	output [3:0] instMemAddrBus; //im_abus
	input [7:0] instMemDataBus; //im_dbus	
	output [3:0] dataMemAddrBus; //dm_abus
	output [7:0] dataMemInDataBus; // dm_in_dbus
	input [7:0] dataMemOutDataBus; //dm_out_dbus
	output [7:0] acOut;	//ac_out
	output [7:0] aluOut; //alu_out
	
	output [7:0] LEDG,LEDR;

	wire[7:0] mux2_out; // Saida de 8 bits do multiplexador 2
	wire[3:0] pc_out, adder_out, mux1_out; // Coisas relacionadas a enderecos
	
	// Instanciaçao dos modulos:
	ContadorDePrograma cp(.dataIn(mux1_out),.reset(reset),.clock(clock),.dataOut(pc_out)); 
	IncrementodoContador somador(.a(pc_out),.b(4'b0001),.adder_out(adder_out));
	
	Acumulador ac(.dataIn(mux2_out),.load(ld_ac),.clock(clock),.dataOut(acOut));
	ULA alu(.a(acOut),.b(dataMemOutDataBus),.opcode(opcode),.aluOut(aluOut));
	Mux2to1_4bit mux1(.i0(adder_out),.i1(instMemDataBus[3:0]),.sel(pc_src),.mux_out(mux1_out));
	Mux2to1_8bit mux2(.i0(aluOut),.i1(dataMemOutDataBus),.sel(ac_src),.mux_out(mux2_out));
		
	assign instMemAddrBus = pc_out;
	assign opcode = instMemDataBus [7:4]; // Bits de opcode sao o primeiro nibble da memoria de instruçoes
	assign dataMemAddrBus = instMemDataBus [3:0]; // Barramento de endereço para memoria de dados
	assign dataMemInDataBus = acOut; // Barramento de entrada da memoria de dados
	
	assign LEDR[3:0] = mux1_out;
	assign LEDG[7:0] = mux2_out;

	assign LEDR[7] = clock;
	assign LEDR[6] = reset;
	
endmodule
	
	