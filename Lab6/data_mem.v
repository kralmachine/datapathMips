module data_mem(clk,adr,writedata,readdata,memread,memwrite);
input clk,memread,memwrite;
input[31:0]adr;
output reg[31:0] readdata;
input [31:0]writedata;
reg[31:0] veri_bellegi[0:31];
initial 
	begin
	veri_bellegi[0]=32'b0000_0000_0000_0000_0000_0000_0000_0000;
	veri_bellegi[1]=32'b0000_0000_0000_0000_0000_0000_0000_0001;
	veri_bellegi[2]=32'b0000_0000_0000_0000_0000_0000_0000_0010;
	veri_bellegi[3]=32'b0000_0000_0000_0000_0000_0000_0000_0011;
	veri_bellegi[4]=32'b0000_0000_0000_0000_0000_0000_0000_0100;
	veri_bellegi[5]=32'b0000_0000_0000_0000_0000_0000_0000_0101;
	veri_bellegi[6]=32'b0000_0000_0000_0000_0000_0000_0000_0110;
	veri_bellegi[7]=32'b0000_0000_0000_0000_0000_0000_0000_0111;
	
	end
always@(posedge clk)
	begin
		if(memread)
			readdata=veri_bellegi[adr];
		else if(memwrite)
			veri_bellegi[adr]=writedata;
	end
endmodule
