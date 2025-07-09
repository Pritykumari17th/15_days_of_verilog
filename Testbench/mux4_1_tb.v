module mux4_1_tb();

reg [5:0]in;
wire out;
integer i;
//instantiate

//mux4_1 dut(.in(in[3:0]),.s1(in[4]),.s0(in[5]),.out(out));

mux4to1 dut1(.A(in[0]),.B(in[1]),.C(in[2]),.D(in[3]),.s1(in[4]),.s0(in[5]),.y(out));

initial begin
$monitor("a=%0b\tb=%0b\tc=%0b\td=%0b\ts1=%0b\ts0=%0b\tout=%0b",in[0],in[1],in[2],in[3],in[4],in[5],out);
in = 4'b1101;
#5;
for(i = 0; i<4;i=i+1)begin
{in[4],in[5]} = i;
#10;
end
#30 $finish;
end
endmodule
