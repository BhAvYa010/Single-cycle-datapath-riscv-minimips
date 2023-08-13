module code_memory(input [31:0] pc, output reg [31:0] instruction);
reg [31:0] instruction_mem [0:99];
initial begin
       instruction_mem[0] <= 32'h00000000;
       instruction_mem[1] <= 32'h01098020;//R type rd(16)=rs(8)(t0)+rt(9)(t1) 
       instruction_mem[2] <= 32'h3510003D;//I type ori $t1,$t0,61
       instruction_mem[3] <= 32'h8E680028;//Load type lw $t0,40($s3)
       instruction_mem[4] <= 32'hAE68003C;//Store type sw $t0,60($s3) 
       instruction_mem[5] <= 32'h1000001C;//J type instruction jump to 112 address location
		 instruction_mem[6] <= 32'h00000000;
		 instruction_mem[28] <= 32'h014C9820; //R type rd(18)=rs(10)+rt(12) 
		 instruction_mem[29] <= 32'h00000000;
    end
always @ (*)
begin 
	instruction = instruction_mem[pc/4];
end
endmodule
//The reason for dividing the program counter (pc) by 4 in your Verilog code is related to the memory addressing scheme used in many computer architectures, including the MIPS architecture that your code seems to be emulating.

//In MIPS, each instruction is stored in memory at an address that is a multiple of 4. This is because MIPS instructions are 32 bits (4 bytes) in length. When an instruction is fetched from memory, the program counter (pc) points to the address of the instruction in memory. However, since instructions are 4 bytes long, the pc value needs to be aligned to a multiple of 4 to ensure that instructions are correctly fetched from memory.