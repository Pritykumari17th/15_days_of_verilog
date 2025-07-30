

module siso_tb;

reg s_in,clk,rst;
wire s_out;

siso dut(s_in,clk,rst,s_out);

initial clk = 0;
always #5 clk = ~clk;

task initilaize();
begin
clk = 0;
s_in = 0;
end
endtask

task reset();
begin
rst = 1;
@(posedge clk);
rst = 0;
end
endtask

//loop index i
integer i = 0;

task data_in(input  [3:0]a);
begin:data_begin

@(posedge clk);
repeat(4)begin
s_in = a[i];
i= i+1;
@(posedge clk);
end
@(posedge clk);
end
endtask

initial begin
 $monitor("%0t  rst=%b  s_in=%b  s_out=%b",$time, rst, s_in, s_out);
reset();
initilaize();


data_in(4'b1101);

$finish;
end
endmodule
