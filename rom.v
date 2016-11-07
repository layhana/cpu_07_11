module InstrucoesdaMemoriaROM(address, dataOut);

input [3:0]address;
output reg [7:0]dataOut;
reg [7:0]rom[0:8];

always @(address)

dataOut = rom[address];

initial

begin
rom[0] = 8'h00;	//inicializa acumulador com 0 
rom[1] = 8'h21;	//subtrai o conteudo do acumulador com o conteudo da memoria posiçao 1
rom[2] =8'h42;		//realiza and entre o acumulador e o conteudo  da memoria na posiçao 2
rom[3] = 8'h63;	//realiza or entre o acumulador e o conteudo  da memoria na posiçao 3
rom[4] = 8'h84;	//realiza not do acumulador com o conteudo da memoria na posiçao r
rom[5]= 8'hA4;		// xor  entre o acumulador e o conteudo da memoria na posiçao 4;
rom[6] = 8'h00;	//adiçao com o conteudo da memoria na posiçao 0
rom[7] = 8'hE0;	//pula para endereço 0000 da instruçao da memoria
end
endmodule 