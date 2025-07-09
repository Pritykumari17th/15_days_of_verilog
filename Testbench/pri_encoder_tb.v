
module pri_encoder_tb;

reg [3:0]in;
wire [1:0]y;
wire valid;

integer i;

//instantiation
pri_encoder dut(.in(in),.y(y),.valid(valid));

initial begin
$display("Input\toutput\tvalid");
$monitor("in = %b\ty = %b\tvalid = %b",in,y,valid);
for (i=0;i<4;i=i+1)begin
in = 4'b0000;
in[i] = 1'b1;
#1;
end

  // Test case with multiple bits high (priority test)
  in = 4'b1010; // should prioritize MSB (bit 3)
  #1;

  // Test case with all 0s
  in = 4'b0000; // valid = 0
  #1;
  
$finish;
end
endmodule
