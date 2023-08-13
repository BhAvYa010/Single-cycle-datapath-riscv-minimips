module alu(input [31:0]rs,rtwire,input [16:0]imm,input [5:0]fn,opcode,output reg [31:0]alu_result, output carry_out,output reg brtrue,input [1:0] brtype,input alusrc,output reg [31:0]data_in,input rd,we);
wire [32:0]tmp;
reg [31:0] rt,extended_imm;
initial begin data_in=32'b0;brtrue<=0;end
always @ (*)
	begin
		case (brtype)
			2'b01 : brtrue <= (rs == rtwire);// brach is i type so rs and rtwire compared and imm is the label (address to jump)
			2'b10 : brtrue <= (rs != rtwire);
			2'b11 : brtrue <= (rs < rtwire) ;
			default : brtrue <= 0;
		endcase
	end
always @ (*)
begin
   extended_imm = { {15{imm[16]}}, imm}; 
	case (alusrc)
	  0: rt<=rtwire;
	  1: begin rt<=extended_imm;
		  end
	endcase
	if({rd,we}==2'b01)
		begin 
			data_in<=rtwire;//when store instructuion
		end
end
assign tmp=rs+rt;
reg [31:0] alusrcwire;
assign carry_out=tmp[32];
always @ (*)
casex (opcode)
		6'b100011: alu_result=rs+rt; //load it calculates rs+imm
		6'b101011: alu_result=rs+rt;  //store instruction 
	   6'b001000: alu_result=rs+rt; //add immediate
		6'b001100: alu_result=rs&rt;
	 	6'b001101: alu_result=rs | rt;
		6'b001110: alu_result=rs^rt;
		6'b000000: begin 
						casex(fn)
								6'b100000 : alu_result=rs+rt;
								6'b100010 : alu_result=rs-rt;
								6'b101010 : alu_result=rs-rt;
								6'b100100 : alu_result=rs & rt;
								6'b100101 : alu_result=rs|rt;
								6'b100110 : alu_result=rs^rt;
								6'b100111 : alu_result=~(rs|rt);
								default : alu_result=rs+rt;
							endcase
						end
endcase	
endmodule
