

module piso(input clk,rst,load,
input [3:0]p_in,
output reg s_out);

reg [3:0]temp;

always @(posedge clk)begin
if(rst)
s_out <= 0;
else if(load)
temp <= p_in;
else
begin
s_out <= temp[0];
temp <= (temp>>1);
end
end
endmodule
