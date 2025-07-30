

module sync_4bit_ctr(input clk, rst, load,
input [3:0] l_data,
output reg [3:0] ctr);

always @(posedge clk)begin
if(rst)
 ctr <= 4'd0;
 else if(load)
 ctr <= l_data;
 else
 ctr <= ctr+4'd1;
 end
 endmodule
 