

module bin_gray_tb;
reg [3:0]b;
wire [3:0]g;

//instantiation

bin_gray dut(b,g);

initial begin
$display("Binary\t->\tGray");
$monitor("%b\t->\t%b",b,g);
b = 4'b1001;
#1;
b= 4'b1110;
#1;
b = 4'b0011;
#1;
b = 4'b0010;

#5 $finish;
end
endmodule
