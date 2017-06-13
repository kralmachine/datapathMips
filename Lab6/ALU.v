module ALU(A,B,Result,AluOp,Ainvert,Binvert,Zero);
input [31:0] A,B;
output reg [31:0] Result; // Normal şartlarda Result register değildir.
input [1:0] AluOp;
input Ainvert,Binvert;
output Zero;
always
   case ({Ainvert,Binvert,AluOp})
	   4'b0000: Result=A&B;
		4'b0001: Result=A|B;
		4'b0010: Result=A+B;
		4'b0110: Result=A-B;
		4'b0111: Result=A<B;
		4'b1100: Result=~(A|B);
	endcase
assign Zero=(Result==0);
endmodule