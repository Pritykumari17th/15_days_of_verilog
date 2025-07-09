



module nor_dec2to4_tb;

reg a, b,en;
wire [3:0]y;

nor_dec2to4 dut(a,b,en,y);

integer i;

initial begin
$display("En\tA\tB\tOutput");
$monitor("%b\t%b\t%b\t%b",en,a,b,y);
en = 0;
a= 0;
b = 0;
#2;
en = 1;
for(i = 0; i < 4; i = i+1)begin
{a,b} = i;
#2;
end
#3 $finish;
end
endmodule
