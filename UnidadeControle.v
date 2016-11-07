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
	4'b0000:
		begin

		end
	4'b0001:
		begin


		end
	4'b0010:		//subtrai
		begin
		mReadFlag = 1'b1;
		mWriteFlag = 1'b0;
		ld_ac = 1'b1;
		ac_src = 1'b0;
		end
	4'b0011:		//and
		begin
		mReadFlag = 1'b1;
		mWriteFlag = 1'b0;
		ld_ac = 1'b1;
		ac_src = 1'b0;
		end
	4'b0100:
	4'b0101:
	4'b0110:
	4'b0111:
	4'b1000:
	4'b1001:
	4'b1000:
	4'b1001:

end 