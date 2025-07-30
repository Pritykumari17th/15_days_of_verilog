



module sync_single_port_ram(input clk,rst,wr_rd_en,
input [3:0]rd_addr,wr_addr,
inout [7:0]data);


reg [7:0]mem[15:0];
reg [7:0]dout;
integer i;


always @(posedge clk)begin
if(rst)
begin
for(i  = 0;i <16; i = i+1)
mem[i] <= 0;
dout<= 0;
end
else if(wr_rd_en)
mem[wr_addr] <= data;
else
dout <= mem[rd_addr];
end

assign data = !wr_rd_en ? dout : 8'bz;

endmodule
