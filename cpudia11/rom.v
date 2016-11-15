module rom(address, dataOut);

input [3:0]address; //abus
output reg [7:0]dataOut; // dbus
reg [7:0]rom[0:8]; //im_array

always @(address)

dataOut = rom[address];

initial

begin
	rom[0] = 8'h00;			//inicializa acumulador com 0 
	rom[1] = 8'b00100001;	//subtrai o conteudo do acumulador com o conteudo da memoria posiçao 1
	rom[2] = 8'b01010010;	//realiza and entre o acumulador e o conteudo  da memoria na posiçao 2
	rom[3] = 8'b01100011;	//realiza or entre o acumulador e o conteudo  da memoria na posiçao 3
	rom[4] = 8'b01110100;	//realiza not do acumulador com o conteudo da memoria na posiçao 4
	rom[5] = 8'b10000100;	// xor  entre o acumulador e o conteudo da memoria na posiçao 4;
	rom[6] = 8'b00010000;	//adiçao com o conteudo da memoria na posiçao 0
	rom[7] = 8'h00;			//pula para endereço 0000 da instruçao da memoria
end
endmodule 