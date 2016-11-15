module BancodeTeste(LEDR); 
reg clock; 
reg reset; 
wire [7:0] dataMemInDataBus; 
wire [7:0] dataMemOutDataBus; 

wire mReadFlag; 
wire mWriteFlag; 
wire [3:0] instMemAddrBus;//im_abus
wire [7:0] instMemDataBus; //dm_abus
wire [3:0] dataMemAddrBus; 
wire [7:0] accOut,aluOut; 
wire [3:0] opcode; 

output [9:0] LEDR;

cpudia11 mcpu(.clock(clock),.reset(reset), .mReadFlag(mReadFlag), .mWriteFlag(mWriteFlag),
	.instMemAddrBus(instMemAddrBus), .instMemDataBus(instMemDataBus), .dataMemAddrBus(dataMemAddrBus),
	.dataMemInDataBus(dataMemInDataBus), .dataMemOutDataBus(dataMemOutDataBus),
	.accOut(accOut), .aluOut(aluOut), .opcode(opcode));

rom IM(.address(instMemAddrBus), .dataOut(dataMemInDataBus));
//InstructionMemory IM (.abus(instMemAddrBus),.dbus(im_dbus));

memoria DM(.rd(mReadFlag) ,.wr(mWriteFlag) ,.adress(instMemDataBus),.inDataBus(dataMemAddrBus) , .outDataBus(dataMemOutDataBus));

//DataMemory DM (.in_dbus(dm_in_dbus),.out_dbus(dm_out_dbus) ); 

initial begin clock = 0; reset = 1;//im_dbus =8'hxx;dm_out_dbus = 8'b00000000; 
#20 reset = 1'b0; 
#500 $finish;
end 

always 
#10 clock = ~clock; 

endmodule 