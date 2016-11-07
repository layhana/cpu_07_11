module CaminhoDeDados (reset, ld_ac, ac_src, pc_src, clock,
	opcode, instMemAddrBus, instMemDataBus,
	dataMemAddrBus, dataMemInDataBus, dataMemOutDataBus,
	acOut, aluOut);

	// DataPath
	
	input reset, ld_ac, ac_src, pc_src, clock;
	output [3:0] opcode;
	output [3:0] instMemAddrBus;
	input [7:0] instMemDataBus;
	output [3:0] dataMemAddrBus;
	output [7:0] dataMemInDataBus;
	input [7:0] dataMemOutDataBus;
	output [7:0] acOut;
	output [7:0] aluOut;

	wire[7:0] mux2_out; // Saida de 8 bits do multiplexador 2
	wire[3:0] pc_out, adder_out, mux1_out; // Coisas relacionadas a enderecos
	
	// Instanciaçao dos modulos:
	ContadorDePrograma cp(.d_in(mux1_out),.reset(reset),.clock(clock),.d_out(pc_out)); 
	IncrementoDoContador somador(.a(pc_out),.b(4'b0001),.adder_out(adder_out));
	Mux2to1_6Bit mux1(.i0(adder_out),.i1(instMemDataBus[3:0]),.sel(pc_src),.mux_out(mux1_out));
	Acumulador ac(.d_in(mux2_out),.load(ld_ac),.clock(clock),.d_out(acOut));
	ULA alu(.a(acOut),.b(dm_out_dbus),.opcode(opcode),.aluOut(aluOut));
	Mux2to1_8Bit mux2(.i0(aluOut),.i1(dm_out_dbus),.sel(ac_src),.mux_out(mux2_out));
	
	assign im_abus = pc_out;
	//assign im_abus = 6'b000000;
	assign opcode = instMemDataBus [7:4]; // Bits de opcode sao o primeiro nibble da memoria de instruçoes
	assign dataMemAddrBus = instMemDataBus [3:0]; // Barramento de endereço para memoria de dados
	assign dataMemInDataBus = acOut; // Barramento de entrada da memoria de dados
	
endmodule
	