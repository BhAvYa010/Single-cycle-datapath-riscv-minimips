module instruction_fetch(input [31:0] instruction, output reg [5:0] rs,rt,rd,sh,output reg [5:0] opcode,fn,output reg [16:0] imm,output reg [25:0] jump);
always @ (*)
begin
	opcode<=instruction[31:26];
	rs		<={1'b0,instruction[25:21]};
	rt		<={1'b0,instruction[20:16]};
	rd		<={1'b0,instruction[15:11]};
	sh		<={1'b0,instruction[10:6]};
	fn		<=instruction[5:0];
	imm	<={1'b0,instruction[15:0]};
	jump	<=instruction[25:0];
end
endmodule























	









