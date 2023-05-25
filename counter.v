//2023.5.7
// design of a counter 

`timescale 1ns/10ps
module counter (
                clk,
                res,
                y
);

input           clk;
input           res;
output[7:0]     y; 

reg [7:0]       y;
wire [7:0]      sum;//+1运算的结果
assign          sum=y+1;// 组合逻辑部分

always @(posedge clk or negedge res )

if(~res) begin
    y<=0;
end

else begin
    y<=sum;
end
endmodule


//----testbench of counter----

module counter_tb; 
reg           clk;
reg           res;
wire[7:0]      y;  
counter counter (
                .clk(clk),
                .res(res),
                .y(y)
);

initial begin
    clk<=0; res<=0;
    #17   res=1; 
    #6000 $stop;
end

always #5 clk<=~clk; //每过5纳秒翻一次，得到一个10纳秒的clk信号

endmodule