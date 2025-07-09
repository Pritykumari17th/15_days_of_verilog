module mux2_1_tb();

reg a,b,s;
wire out;
integer i;

//Instantiate
mux2_1 dut(.a(a),.b(b),.s(s),.out(out));

initial begin

$monitor("time = %0t\ta= %0b\tb= %0b\ts = %0b\tout = %0b",$time,a,b,s,out);

for(i=0;i<8;i=i+1)begin
{a,b,s}=i[2:0];
#10;
end
$finish;
end

endmodule
