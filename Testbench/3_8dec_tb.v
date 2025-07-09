module dec_3_8_tb();

reg [2:0]in;
reg En;
wire [7:0]out;

//instantiation
dec_3_8 dut(.in(in),.out(out),.En(En));

integer i;

initial begin
En = 1;
$display("Time\tEnable\tinput\toutput");
$monitor("%t\t%b\t%b\t%b",$time,En,in,out);
for(i=0; i<8;i=i+1)begin
in = i[2:0];
#5;
end

$finish;

end
endmodule
