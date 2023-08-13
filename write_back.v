module write_back(input [31:0] data_out,alu_out,inc_pc,output reg [31:0] regedit,input [1:0] reginsrc);
always @ (*)
begin
case (reginsrc)
	2'b00: regedit<=data_out;
	2'b01: regedit<=alu_out;
	2'b10: regedit<=inc_pc;
	//11: y=i3;
endcase
end
endmodule