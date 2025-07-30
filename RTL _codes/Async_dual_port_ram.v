
module Async_dual_port_RAM (
    input wr_clk, rd_clk, rst, wr_en, rd_en,
    input [3:0] wr_addr, rd_addr,
    input [7:0] wr_data,
    output reg [7:0] data_out
);

reg [7:0] mem[15:0]; // 16 locations, 8-bit wide

// Write logic (on write clock)
always @(posedge wr_clk) begin
    if (wr_en)
        mem[wr_addr] <= wr_data;
end

// Read logic (on read clock)
always @(posedge rd_clk) begin
    if (rst)
        data_out <= 0;
    else if (rd_en)
        data_out <= mem[rd_addr];
end

endmodule




/*
module Async_dual_port_RAM(input wr_clk,rd_clk,rst,wr_en,rd_en,
input [3:0]wr_addr,rd_addr,
input [7:0]wr_data,
output reg [7:0]data_out);

reg [7:0]mem[15:0];

always @(posedge wr_clk)begin
if(wr_en)
mem[wr_addr] <= wr_data;
end

always @(posedge rd_clk)begin
if(rst)
data_out<= 0;
else if(rd_en)
data_out <= mem[rd_addr];
end

endmodule
*/