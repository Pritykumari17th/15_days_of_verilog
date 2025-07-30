

module sipo
(input clk, rst,
input s_in,
output [3:0]p_out);

reg [3:0]internal_shift;

always @(posedge clk)begin
if(rst)
internal_shift <= 0;
else
internal_shift <= {s_in,internal_shift[2:0]};
end
assign p_out = internal_shift;

endmodule
