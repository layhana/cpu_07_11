module cpu_07_11(clock, reset, mReadFlag, mWriteFlag,
	instMemAddrBus, instMemDataBus, dataMemAddrBus,
	dataMemInDataBus, dataMemOutDataBus,
	accOut, aluOut, opcode);
	
	input clock, reset;
	output mReadFlag, mWriteFlag; // Flags que habilitam operaçoes de leitura e escrita na memoria, respectivamente
	output [3:0] instMemAddrBus; // Endereço da instruçao na memoria de instruçoes
	input [7:0] instMemDataBus; // Dado (8 bits) advindo da memoria de instruçoes
	input [3:0] dataMemAddrBus; // Edereço de um dado na memoria de dados
	output [7:0] dataMemInDataBus; // Barramento de dados de entrada da memoria
	input [7:0] dataMemOutDataBus; // Barramento de dados de saida da memoria
	output [7:0] accOut, aluOut; // 8 bits presentes no acumulador e saida da ULA, respectivamente
	output [3:0] opcode;
	
	wire ac_src, ld_ac, pc_src, jmp_uncond;
	
	memoria mem(rd,wr,adress,inDataBus,outDataBus);
	InstrucoesdaMemoriaROM rom(address,dataOut);
	UnidadeControle ud(opcode,mReadFlag,mWriteFlag, ac_src, ld_ac, pc_src, jmp_uncond);
endmodule
	