module UnidadeControle(opcode,mReadFlag,mWriteFlag, ac_src, ld_ac, pc_src, jmp_uncond);

input [3:0]opcode;
output reg mReadFlag, mWriteFlag;	// Flags que habilitam operaçoes de leitura e escrita na memoria, respectivamente
output reg ac_src, ld_ac, pc_src, jmp_uncond;

always @(opcode)
begin
mReadFlag = 1'b0;
mWriteFlag = 1'b0;
ac_src = 1'b0;
pc_src = 1'b0;
ld_ac = 1'b0;
jmp_uncond = 1'b0;

	case(opcode)
		4'b0000:		//saida 0
			begin
			mReadFlag = 1'b0;
			mWriteFlag = 1'b1;
			//ld _ac =
			//ac_src = 
			end
		4'b0001:		//soma
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;

			end
		4'b0010:		//subtrai
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b0011:		//multiplicaçao
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b0100:		//divisao
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b0101:		//and
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b0110:		//or
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b0111:		//not
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b1000:		//xor
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b1001:		//xnor
			begin
			mReadFlag = 1'b1;
			mWriteFlag = 1'b0;
			ld_ac = 1'b1;
			ac_src = 1'b0;
			end
		4'b1000:
			begin
			end
		4'b1001:
			begin
			end
		4'b1111: //sel vai ser 0 no mux e os dados serao os da memoria de instrucao.
			begin
			mReadFlag = 1'b0;
			mWriteFlag = 1'b0;
			ld_ac = 1'b0;
			ac_src = 1'b0;
			pc_src = 1'b1; // envia pra o sel no mux.
			jmp_uncond = 1'b1;
			end
		default:
			begin
			mReadFlag = 1'b0;
			mWriteFlag = 1'b0;
			ld_ac = 1'b0;
			ac_src = 1'b0;
			pc_src = 1'b1;
			
			end
	endcase
end 
endmodule 