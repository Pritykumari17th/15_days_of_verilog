module r_c_add_tb();

reg [3:0]a;
reg [3:0]b;
reg c_in;
wire [3:0]s;
wire carry_out;

integer i,j,k;

//instantiate

ripple_carry_adder dut(a,b,c_in,s,carry_out);

initial begin
$display("Time\tA\tB\tc_in\tsum\tcarry");
$monitor("%0t\t%b\t%b\t%b\t%b\t%b",$time,a,b,c_in,s,carry_out);

for(i=0;i<16;i=i+1)begin //a is 4-bit so 2^4=16 (i.e. 0000 - 1111)
for(j=0; j<16;j=j+1)begin
for(k=0;k<2;k=k+1)begin
a = i;
b = j;
c_in = k;
#1;
end
end
end

$finish;
end
endmodule


