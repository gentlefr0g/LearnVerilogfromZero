//2023.5.4
//补码转换逻辑设计

`timescale 1 ns/10ps

module comp_conv (
    a,
    a_comp
);
input[7:0]        a;
output[7:0]       a_comp;

wire[6:0]         b;//按位取反的幅度位； wire 单元内部连线 reg 寄存器型，就不需要传输了   
wire[7:0]        y;//负数的补码

assign            b=~a[6:0];
assign            y[6:0]=b+1;//按位取反加1；
//如果不用b中介变量，直接写  assign  y[6:0]=~a[6:0]+1; 取反加一
assign            y[7]=a[7];//符号位不变；

assign            a_comp=a[7]?y:a;//二选一；

//y={a[7],~a[6:0]+1}; 这样也行
//a_comp=a[7]?{a[7],~a[6:0]+1}:a; 这样用一句代表了上面所有的赋值；

endmodule


//----testbench of comp_conv----
module comp_conv_tb;
reg [7:0]         a_in;
wire [7:0]        y_out;
comp_conv comp_conv(
    .a(a_in),
    .a_comp(y_out)
);

initial begin
    a_in<=0;

    #3000 $stop;
    
end
always #10 a_in<=a_in+1;//每过十个单位，a_in加1
// always后面不加敏感变量，可能是因为case遍历要256行，这样相当于always 1 ?
// 这里 a_in加1不考虑率符号位吗？

endmodule
