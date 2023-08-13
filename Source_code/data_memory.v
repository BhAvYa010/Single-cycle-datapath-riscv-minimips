module data_memory(input rst,rd,we,input [31:0] data_in,add, output reg [31:0] data_out);
reg [31:0] memory [0:99];
initial begin data_out = 32'h00000000;end

always @ (*)
begin
 if (rst)
	   begin 
			memory[50] <= 32'h000000AA;
			memory[60] <= 32'h000000BB;
			memory[70] <= 32'h0000000CC;
			memory[80] <= 32'h0000000DD;
	   end
	else begin
		case ({rd,we})//1 when write enable and 01 when read enable 10
			 2'b01: memory[add]<=data_in;//data output
			 2'b10: data_out<=memory[add];//data read
			endcase
			end
end
endmodule