//Address generator module
module address_generator(input rst,clk,brtrue,input [1:0]pcsrc, output reg [31:0] pc, input [25:0] jump,input [31:0] rso,SysCallAdd,input [16:0] imm);
reg [31:0] pcnext,inc_pc;
reg extended_imm;
initial begin pc<=0;extended_imm <= { {15{imm[16]}}, imm};end
wire [27:0] jmp = {jump,2'b00};// 2 lsb's of pc is always 00 as it starts with 4 and difference of 4
always @ (*)
begin

 inc_pc <= brtrue ? pc +4+extended_imm : pc+4;end
always @ (*)
begin
  // beq s1,s2,label here label is imm value
  case(pcsrc)
  2'b00 : pcnext <= brtrue ? pc +4+extended_imm : pc+4;// when branch is true brtrue=1  
  2'b01 : pcnext <= {{4{inc_pc[31:28]}},jmp};
  2'b10 : pcnext <= rso;			// used in case of jr where return address is stored in $31 
  2'b11 : pcnext <= SysCallAdd; 	//The syscall address is required to transfer control from user-level processes to the operating system kernel when invoking system calls for requesting services.
  endcase
end
always @ (posedge clk)
begin
if (rst)
  pc<=32'd0;
 else 
  pc<=pcnext;
end
endmodule