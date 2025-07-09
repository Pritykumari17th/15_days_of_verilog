module half_adder_tb();

reg a,b;
wire sum, cout;

half_adder dut(a,b,sum,cout);
integer i;
initial begin
$monitor("a=%0b, b= %0b, sum = %0b, cout = %0b",a,b,sum,cout);
for(i = 0; i < 4;i = i+1)begin
{a,b} = i[1:0];

#10;
end

$finish();
end
endmodule
