
module bi_enc_tb;

reg [7:0]in;
wire [2:0]y;

//instantiation
bi_encoder dut(in,y);

integer i;

initial begin

$display("\tTime\tInput\toutput");
$monitor("%t\t%b\t%b",$time,in,y);

for(i=0; i<8; i=i+1)begin
in = 8'b00000000;
in[i] = 1'b1;
#1;
end
#3 $finish;
end

endmodule
