

module sync_ctr_enable(input clk, rst,en,output reg [3:0]ctr);

always @(posedge clk)begin
if(rst)
ctr <= 4'd0;
else if(en)
ctr <= ctr+4'd1;
end

endmodule
