module regfile(input regwrite,rst,input [1:0] regdst,input [5:0] rs,rt,rd,ra,input [31:0]regedit,output reg [31:0] rso,rto);
reg [31:0] regfile [0:31];
reg [4:0] regdstwire;
always @ (*)
begin 
   if (rst)
	   begin 
		   regfile[0] <= 32'h00000000;
			regfile[8] <= 32'h0000000A;
			regfile[9] <= 32'h0000000B;
			regfile[16]<= 32'h00000004;
			regfile[10]<= 32'h0000000D;
			regfile[12]<= 32'h000000AA;
			regfile[19]<= 32'h0000000A;
	   end
		else begin
         rso<=regfile[rs];
		   rto<=regfile[rt];
	   	case (regdst)
				00: regdstwire<=rt;
				01: regdstwire<=rd;
				10: regdstwire<=ra;
				//11: y=i3;
			endcase
      if(regwrite==1) 
			begin
				regfile[regdstwire]<=regedit;
			end end
end
endmodule