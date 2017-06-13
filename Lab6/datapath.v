module datapath(clk,writedata,pc,reset);
input clk,reset;
wire [31:0] inst;
wire RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
wire [1:0] ALUOp;
wire [3:0] ALUCont;
wire [31:0] adr;
wire [4:0] writeregister;
wire [31:0] readdata1,readdata2,op2,op8;
output [31:0] writedata;
wire [31:0] extend_imm;
output [31:0]pc;
wire [31:0] op3,op4,op5,op6,op7;
wire Zero;
wire a;

add instadd1(.pc(op6),.out(op3),.clk(clk));

shift instsift(.in(extend_imm),.out(op4));

add2 instadd2(.add(op3),.shift(op4),.out(op5),.clk(clk));

pc_control instpc(clk,op6,pc,reset);

assign a=Zero&Branch;

mux32bit instmux(.s(a),.I0(op3),.I1(op5),.Y(pc));

control instcont(.opcode(inst[31:26]), .con({RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp[1],ALUOp[0]}));

ALUControl instALUcont(.ALUOp(ALUOp),.funct(inst[5:0]),.ALUCont(ALUCont));

inst_mem inst0(.clk(clk),.inst(inst),.control(op6));

mux5bit inst4(.s(RegDst),.I0(inst[20:16]),.I1(inst[15:11]),.Y(writeregister));

registerfile inst1(.writedata(writedata),.readdata1(readdata1),.readdata2(readdata2),.writeregister(writeregister), .readregister1(inst[25:21]),.readregister2(inst[20:16]),.clk(clk),.write(RegWrite));

mux32bit inst2(.s(ALUSrc),.I0(readdata2),.I1(extend_imm),.Y(op2));

ALU inst3(.A(readdata1),.B(op2),.Result(op8),.AluOp(ALUCont[1:0]),.Ainvert(ALUCont[3]),.Binvert(ALUCont[2]),.Zero(Zero));

data_mem inst4587(.clk(clk),.adr(op8),.writedata(readdata2),.readdata(op7),.memread(MemRead),.memwrite(MemWrite));

mux32bit instmux2(.s(MemtoReg),.I0(op8),.I1(op7),.Y(writedata));

signextend inst5(inst[15:0],extend_imm);

endmodule
