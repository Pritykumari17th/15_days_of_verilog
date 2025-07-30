


module fifo(input clk, rstn, we, re,
            input [7:0] data_in,
            output reg [7:0] data_out,
            output reg empty, full);

  reg [7:0] mem[15:0];
  reg [4:0] wr_ptr, rd_ptr;

  integer i;

  wire [4:0] wr_ptr_next = wr_ptr + (we && !full);
  wire [4:0] rd_ptr_next = rd_ptr + (re && !empty);

  // Write and Read
  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      for (i = 0; i < 16; i = i + 1)
        mem[i] <= 0;
      wr_ptr <= 0;
      rd_ptr <= 0;
      data_out <= 0;
    end else begin
      if (we && !full) begin
        mem[wr_ptr[3:0]] <= data_in;
        wr_ptr <= wr_ptr + 1;
      end
      if (re && !empty) begin
        data_out <= mem[rd_ptr[3:0]];
        rd_ptr <= rd_ptr + 1;
      end
    end
  end

  // Empty and Full Status
  always @(*) begin
    empty = (wr_ptr == rd_ptr);
    full  = (wr_ptr[4] != rd_ptr[4]) && (wr_ptr[3:0] == rd_ptr[3:0]);
  end

endmodule
