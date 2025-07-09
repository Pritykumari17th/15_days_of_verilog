

module parity_gen_tb;

reg [3:0]in;
wire even_parity,odd_parity;

parity_gen dut(in,even_parity,odd_parity);

initial begin

$display("in\teven_parity\todd_parity");
$monitor("%b\t%b\t%b",in,even_parity,odd_parity);

in = 4'b0001;
#1 in = 4'b0110;
#1 in = 4'b0000;
#1 in = 4'b0101;
#1 in = 4'b1111;
#1 in = 4'b1110;

#10 $finish;

end
endmodule
