module fifo_tb;

  reg clk, rstn, we, re;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire empty, full;

  // Instantiate the FIFO
  fifo dut (
    .clk(clk),
    .rstn(rstn),
    .we(we),
    .re(re),
    .data_in(data_in),
    .data_out(data_out),
    .empty(empty),
    .full(full)
  );

  // Clock generation
  always #5 clk = ~clk;

  integer i;

  initial begin
    clk = 0; rstn = 0; we = 0; re = 0; data_in = 0;

    // Reset
    #10 rstn = 1;
    $display("\n--- FIFO WRITE TEST ---");

    // Write 16 values to FIFO
    for (i = 0; i < 16; i = i + 1) begin
      @(posedge clk);
      if (!full) begin
        data_in = i + 1;
        we = 1;
        $display("Writing: %0d, full = %b, empty = %b", data_in, full, empty);
      end
    end
    @(posedge clk); we = 0;

    // Check if FIFO is full
    if (full)
      $display("FIFO is FULL after 16 writes.");

    $display("\n--- FIFO READ TEST ---");

    // Read 16 values from FIFO
    for (i = 0; i < 16; i = i + 1) begin
      @(posedge clk);
      if (!empty) begin
        re = 1;
        $display("Reading: %0d, full = %b, empty = %b", data_out, full, empty);
      end
    end
    @(posedge clk); re = 0;

    // Check if FIFO is empty
    if (empty)
      $display("FIFO is EMPTY after 16 reads.");

    $display("\n--- TEST COMPLETE ---");
    $finish;
  end

endmodule
