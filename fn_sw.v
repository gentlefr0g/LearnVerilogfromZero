// 2023.4.12
//二选一逻辑设计

`timescale 1ns/10ps
module fn_sw (
        a,
        b,
        sel,
        y
);
input   a;
input   b;
input   sel;
output  y;
// assign y=sel?(a^b):(a&b);  //sel等于1的时候，用冒号前的值，sel等于0用后面 条件运算符
//如果不用always语句，用上面语句赋值，用always的话用下面
reg     y;          //always 语句里面赋值变量需要是reg
always @(a or b or sel) //a b sel 是敏感变量，组合逻辑的输入，有几个写几个，不可少，否者会出现latch
begin
    if (sel==1) begin
        y<=a^b;
    end
    else begin
        y<=a&b;
end 
end
endmodule


//----testbench of fn_sw----
module fn_sw_tb;
//tb输入定义为reg，输出定义为wire
reg      a,b,sel;
wire     y;
fn_sw fn_sw (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
);

initial begin
            a<=0;b<=0;sel<=0;
    #10     a<=0;b<=0;sel<=1;
    #10     a<=0;b<=1;sel<=0;
    #10     a<=0;b<=1;sel<=1;
    #10     a<=1;b<=0;sel<=0;
    #10     a<=1;b<=0;sel<=1;
    #10     a<=1;b<=1;sel<=0;
    #10     a<=1;b<=1;sel<=1;
    #10     $stop;
end
    
endmodule





