

module pipo(input clk, rst,
input [3:0]parallel_in,
output reg [3:0]parallel_out);

always @(posedge clk)begin
if(rst)
parallel_out <= 0;
else
parallel_out <= parallel_in;
end
endmodule
