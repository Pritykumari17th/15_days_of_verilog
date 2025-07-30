

module up_ctr_tb;

reg rst,clk;
wire [3:0]cnt;


up_ctr dut(rst,clk,cnt);
always #2 clk = ~ clk;

initial begin
clk = 0;
rst = 1;
#4;

$display("\trst\tcount");
$monitor("%b\t%b",rst,cnt);

rst = 0;
#15;
rst = 1;
#4;
rst = 0;


#100;
$finish;
end

endmodule
