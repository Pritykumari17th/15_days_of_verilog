

module dec2to4_tb;

reg A,B;
wire [3:0]y;
integer i;

dec2to4 dut(.A(A),.B(B),.y(y));

initial begin
$display("A\tB\tY");
$monitor("%b\t%b\t%b",A,B,y);

for(i=0;i<4;i=i+1)begin
{A,B} = i;
#1;
end
$finish;
end
endmodule

