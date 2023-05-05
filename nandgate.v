//2023.4.12
//design of nand_gate

`timescale 1ns/10ps
module nand_gate (
            A,
            B,
            Y
);
input       A;
input       B;
output      Y;    
assign      Y=~(A&B);
endmodule




// ----testbench of the nand_gate----

module nand_gate_testbench; 
reg         aa;
reg         bb;
wire        yy;
nand_gate nand_gate (
            .A(aa),
            .B(bb),
            .Y(yy)
            );
initial begin
        aa<=0;bb<=0;        //reg型的变量赋值需要用带箭头的<=，代表实际电路
    #10 aa<=0;bb<=1;
    #10 aa<=1;bb<=0;
    #10 aa<=1;bb<=1;
    #10 $stop;
end    
endmodule