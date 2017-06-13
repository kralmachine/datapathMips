module add2(add,shift,out,clk);
input[31:0]add,shift;
input clk;
output reg [31:0] out;
always@(posedge clk)
	out=add+shift;
endmodule
