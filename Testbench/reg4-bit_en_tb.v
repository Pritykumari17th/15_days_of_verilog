

//4-bit register with enable
module reg_4bit_tb;
reg rstn,clk,en;
reg [3:0]in;
wire [3:0]Q;

reg_4bit dut(rstn, clk, en,in,Q);

always #2 clk = ~clk;

initial begin
clk = 0;
rstn = 0;
en = 0;
$display("\tTime\trstn\ten\tin\tQ");
$monitor("%t\t%b\t%b\t%b\t%b",$time,rstn,en,in,Q);
//test 1
#2;
rstn = 1;
en = 1;
in = 4'b1001;
#2;
in = 4'b1110;
#2;
in = 4'b1101;
#4;
in = 4'b1011;
#2;
en = 0;
#3
en = 1;

in = 4'b1111;
#8;
in = 4'b1000;

#20 $finish;
end
endmodule
