

module siso(input s_in,clk,rst,output reg s_out);

reg [3:0]internal_shift;

always @(posedge clk or posedge rst)begin
if(rst)
internal_shift<= 4'b0000;
else begin
internal_shift <= {s_in,internal_shift[3:1]};//right shift
s_out <= internal_shift[0];
end
end
endmodule
