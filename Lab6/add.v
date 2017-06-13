module add(pc,out,clk);
input[31:0]pc;
input clk;
output reg[31:0]out=0;
always@(posedge clk)
	 out=pc+4;
endmodule
