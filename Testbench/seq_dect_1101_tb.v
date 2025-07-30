

module seq_1101_tb;

reg clk,rst,x;
wire z;
reg [15:0]in;

always #2 clk= ~clk;

//instantiate
seq_1101 dut(clk,rst,x,z);

integer i;

initial begin
in = 15'b111010110101101;
$display("in = %b\nrst\tx\tz",in);
$monitor("%b\t%b\t%b",rst,x,z);
rst = 1;
clk = 0;

#4 rst = 0;

for (i = 0; i<16;i=i+1)begin
@(posedge clk);
x = in[i];
//#4;
end
#50 $finish;
end
endmodule

