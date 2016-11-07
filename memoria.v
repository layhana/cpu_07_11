module memoria(rd,wr,adress,inDataBus,outDataBus);

input rd,wr;	//read enable e write enable
input [3:0]adress;
input [7:0]inDataBus; //barramento de dados de entrada
output reg [7:0]outDataBus;	//barramento da saida de dados
reg [7:0]memory[0:15];

always @(rd, inDataBus)		
begin
	if(rd)
	outDataBus = memory[adress];	//barramenro de saida de dados recebe conteudo da memoria
end

always @(wr, inDataBus)
begin
	if(wr)
	memory[adress] = inDataBus;	//memoria recebe conteudo do barramento de entrada de dados
end

initial			//inicializa alguns dados na memoria
begin					
	memory[0]= 8'b00000001;
	memory[1]= 8'b00000010;
	memory[2]= 8'b00000011;
	memory[3]= 8'b00000100;
	memory[4]= 8'b00000101;
end


endmodule 