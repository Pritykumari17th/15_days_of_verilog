

module tb_async_dual_port_RAM;

reg wr_clk, rd_clk, rst, wr_en, rd_en;
reg [3:0] wr_addr, rd_addr;
reg [7:0] wr_data;
wire [7:0] data_out;

Async_dual_port_RAM dut (
    .wr_clk(wr_clk), .rd_clk(rd_clk), .rst(rst),
    .wr_en(wr_en), .rd_en(rd_en),
    .wr_addr(wr_addr), .rd_addr(rd_addr),
    .wr_data(wr_data), .data_out(data_out)
);

// Clock generation
always #5 wr_clk = ~wr_clk;
always #7 rd_clk = ~rd_clk;

integer i;

initial begin
    // Initialize
    wr_clk = 0; rd_clk = 0;
    rst = 1; wr_en = 0; rd_en = 0;
    wr_addr = 0; rd_addr = 0;
    wr_data = 0;

    #10 rst = 0;

    // Write data into address 0 to 7
    wr_en = 1;
    for (i = 0; i < 8; i = i + 1) begin
        wr_addr = i;
        wr_data = i + 8'hA0; // data = A0, A1, A2,...
        #10;
    end
    wr_en = 0;

    // Read back from 0 to 7
    #10;
    rd_en = 1;
    for (i = 0; i < 8; i = i + 1) begin
        rd_addr = i;
        #14; // wait enough for rd_clk posedge
        $display("Read data from addr %0d = %h", i, data_out);
    end
    rd_en = 0;

    #20 $finish;
end

endmodule
