

module dual_port_RAM(input clk,rst,wr_en,rd_en,
input [7:0]w_data,
input [3:0]w_addr,rd_addr,
output reg [7:0]rd_data);

parameter WIDTH = 8, DEPTH = 16;

reg [WIDTH-1:0]mem[DEPTH-1:0];
integer i;

always @(posedge clk)begin
if(rst)begin
for(i = 0;i<DEPTH;i=i+1)begin
mem[i] <= 0;
end
end
else begin
if(wr_en)
mem[w_addr] <= w_data;

if(rd_en)
rd_data <= mem[rd_addr];
end

end
endmodule
