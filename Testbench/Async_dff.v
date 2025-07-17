

module async_dff(input clk,rst,D,output reg q);

always @(posedge clk or posedge rst )begin
if(rst)
q <= 1'b0;
else
q<= D;
end
endmodule
