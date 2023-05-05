//2023.4.12
//design of nand_gate_4bits

`timescale 1ns/10ps
module nand_gate_4bits (
                        A,
                        B,
                        Y
);
input[3:0]       A;
input[3:0]       B;
output[3:0]      Y;    

assign      Y=~(A&B);

endmodule




// ----testbench of the nand_gate----

module nand_gate_4bits_testbench; 
reg[3:0]         aa;
reg[3:0]         bb;
wire        yy;
nand_gate_4bits nand_gate_4bits (
            .A(aa),
            .B(bb),
            .Y(yy)
            );
initial begin
        aa<=4'b0000;bb<=4'b1111;        
    #10 aa<=4'b0010;bb<=4'b0101; 
    #10 aa<=4'b0111;bb<=4'b1010; 
    #10 aa<=4'b0110;bb<=4'b0110; 
    #10 $stop;
end    
endmodule