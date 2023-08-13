module controller(input [5:0] opcode,fn,output reg regwrite,alusrc,rd,we,output reg [1:0] pcsrc,output reg [1:0] regdst,reginsrc,brtype);
initial begin pcsrc<=2'b0;end
always @ (*)
begin
	casex (opcode)
	   6'b001111: begin//lui
		   regwrite<=1;
			regdst<=00;
			reginsrc<=01;
			alusrc<=1;
		   rd<=0;
			we<=0;
			brtype<=0;
			pcsrc<=00;
			end
		6'b001000: begin //add immediate
		   regwrite<=1;
			regdst<=00;
			reginsrc<=01;
			alusrc<=1;
		   rd<=0;
			we<=0;
			brtype<=0;
			pcsrc<=00;
			end
      6'b001100: begin//and immediate
			regwrite<=1;
			regdst<=00;
			reginsrc<=01;
			alusrc<=1;
		   rd<=0;
			we<=0;
			brtype<=0;
			pcsrc<=00;
			end
		6'b001101: begin //or immediate
		   regwrite<=1;
			regdst<=00;
			reginsrc<=01;
			alusrc<=1;
			rd<=0;
			we<=0;
			brtype<=0;
			pcsrc<=00;
			end
		6'b001110: begin //xor immediate
		   regwrite<=1;
			regdst<=00;
			reginsrc<=01;
			alusrc<=1;
			rd<=0;
			we<=0;
			brtype<=0;
			pcsrc<=00;
			end
		6'b100011: begin //load
			regdst<=00;
			regwrite<=1;
			reginsrc<=00;
			alusrc<=1;
			rd<=1;
			we<=0;
			pcsrc<=00;
			brtype<=00;
			end
		6'b101011: begin //store
			regwrite<=0;
			alusrc<=1;
			rd<=0;
			we<=1;
			pcsrc<=00;
			brtype<=00;
			end
	   
		6'b000001: //Branch on less than 0 
			begin
			regwrite<=0;
			rd<=0;
			we<=0;
			brtype<=11;
			pcsrc<=00;
			end
		6'b000010://Branch on equal
			begin
			regwrite<=0;
			brtype<=01;
			rd<=0;
			we<=0;
		   pcsrc<=00;
			end
		6'b000101: //Branch on not equal
		   begin
			regwrite<=0;
			brtype<=10;
			rd<=0;
			we<=0;
			pcsrc<=00;
			end
		6'b000100: begin //jump 
			regwrite<=0;
			pcsrc<=01;
			rd<=0;
			we<=0;
			
			end
		6'b000000: begin 
			casex(fn)//alu
				6'b100000: begin 	//add
					regdst<=01;
					regwrite<=1;
					reginsrc<=01;
					alusrc<=0;
					pcsrc<=00;
					rd<=0;
					we<=0;
					brtype<=00;
					end
				6'b100010: begin  //sub
					regdst<=01;
					regwrite<=1;
					reginsrc<=01;
					alusrc<=0;
					pcsrc<=00;
					rd<=0;
					we<=0;
					brtype<=00;
					end
				6'b001000: begin //jump register 
					regwrite<=0;
					pcsrc<=10;
					rd<=0;
					we<=0;
					end
				6'b001100: begin //systemcall 
					regwrite<=0;
					pcsrc<=11;
					rd<=0;
					we<=0;
					end	
			endcase
			end
endcase
end
endmodule 