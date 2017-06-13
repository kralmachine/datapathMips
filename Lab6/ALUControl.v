module ALUControl(ALUOp,funct,ALUCont);
input [1:0] ALUOp;
input [5:0] funct;
output reg [3:0] ALUCont;
always @(ALUOp,funct)
begin
   if (ALUOp==2'b00)
	   ALUCont=4'b0010;
	else if (ALUOp==2'b01)
	        ALUCont=4'b0110;
	else if (ALUOp==2'b10)
	        case (funct)
			  6'b10_0000: ALUCont=4'b0010;
			  6'b10_0010: ALUCont=4'b0110;
			  6'b10_0100: ALUCont=4'b0000;
			  6'b10_0101: ALUCont=4'b0001;
			  6'b10_1010: ALUCont=4'b0111;
			  6'b10_0111: ALUCont=4'b1100;
			  endcase
end
endmodule