//2023.4.12
// design of inv
`timescale 1ns/1ps
module inv(
          A,
          Y
);
input     A;
output    Y;
assign    Y=~A;

endmodule


//---- testbench of inv----
module inv_testbench;
reg       aa;
wire      yy;
inv    inv(
        .A(aa),   
        .Y(yy)
);

initial begin
        aa<=0;
    #10 aa<=1;
    #10 aa<=0;
    #10 aa<=1;
    #10 $stop;
end

endmodule