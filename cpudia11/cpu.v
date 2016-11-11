module cpu_07_11(clock, reset, mReadFlag, mWriteFlag,
	instMemAddrBus, instMemDataBus, dataMemAddrBus,
	dataMemInDataBus, dataMemOutDataBus,
	accOut, aluOut, opcode);
	
	input clock, reset;
	output mReadFlag, mWriteFlag; // Flags que habilitam operaçoes de leitura e escrita na memoria, respectivamente
	output [3:0] instMemAddrBus; // Endereço da instruçao na memoria de instruçoes (im_abus)
	input [7:0] instMemDataBus; // Dado (8 bits) advindo da memoria de instruçoes	(im_dbus)
	input [3:0] dataMemAddrBus; // Edereço de um dado na memoria de dados	(dm_abus)
	output [7:0] dataMemInDataBus; // Barramento de dados de entrada da memoria (dm_in_dbus)
	input [7:0] dataMemOutDataBus; // Barramento de dados de saida da memoria	(dm_out_dbus)
	output [7:0] accOut, aluOut; // 8 bits presentes no acumulador e saida da ULA, respectivamente
	output [3:0] opcode;
	
	wire ac_src, ld_ac, pc_src, jmp_uncond;
	wire [3:0] opcode;
	
	//Datapath dpu..
	CaminhoDeDados md_path(.reset(reset), .ld_ac(ld_ac), .ac_src(ac_src), .pc_src(pc_src), .clock(clock),
	.opcode(opcode), .instMemAddrBus(instMemAddrBus), .instMemDataBus(instMemDataBus),
	.dataMemAddrBus(dataMemAddrBus), .dataMemInDataBus(dataMemInDataBus), .dataMemOutDataBus(dataMemOutDataBus),
	.acOut(accOut), .aluOut(aluOut));

	/*memoria mem(rd,wr,adress,inDataBus,outDataBus);
	InstrucoesdaMemoriaROM rom(address,dataOut);*/
	
	UnidadeControle ud(.opcode(opcode),.mReadFlag(mReadFlag),.mWriteFlag(mWriteFlag), .ac_src(ac_src), 
		.ld_ac(ld_ac), .pc_src(pc_src), .jmp_uncond(jmp_uncond));
endmodule
	