// This is the main module where all the stages are combined
module practical_single(input rst,clk);

// Module instances
wire [31:0] pc,instruction,regedit,rso,rto,inc_pc,SysCallAdd,alu_result,data_in,data_out;
wire [25:0] jump;
wire [16:0] imm;
wire [5:0] opcode,fn,rs,rt,rd,sh,ra;
wire [1:0] regdst,reginsrc,brtype,pcsrc;
wire re,we,brtrue,carry_out,regwrite,alusrc;

//Main modules
address_generator a1(rst,clk,brtrue,pcsrc,pc,jump,rso,SysCallAdd,imm);

code_memory a2(pc,instruction);

instruction_fetch a3(instruction,rs,rt,rd,sh,opcode,fn,imm,jump);

regfile a4(regwrite,rst,regdst,rs,rt,rd,ra,regedit,rso,rto);

alu a5(rso,rto,imm,fn,opcode,alu_result,carry_out,brtrue,brtype,alusrc,data_in,re,we);

data_memory a6(rst,re,we,data_in,alu_result,data_out);

write_back a7(data_out,alu_result,inc_pc,regedit,reginsrc);

controller a8(opcode,fn,regwrite,alusrc,re,we,pcsrc,regdst,reginsrc,brtype);


endmodule