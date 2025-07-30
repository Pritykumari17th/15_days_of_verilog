

module seq_1101(input clk, rst, x, output reg z);

reg [2:0]states;
parameter s0 = 3'd0,s1=3'd1,s2=3'd2,s3=3'd3;

always @(posedge clk or posedge rst) begin
if(rst)begin
states <= 0;
z <= 0;
end
else begin
z <= 0;
case (states)
s0 : states <= x ? s1:s0;
s1 : states <= x ? s2:s0;
s2 : states <= x ? s1:s3;
s3 : begin
z <= x ? 1'd1:1'd0;
states <= x ? s1: s0;
end
endcase
end
end
endmodule

