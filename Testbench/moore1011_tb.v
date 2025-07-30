

module moore1011_tb;

  reg clk, rst, x;
  wire z;

  // Instantiate the DUT
  moore1011 dut(clk, rst, x, z);

  // Generate clock
  always #5 clk = ~clk; // 10ns clock period

  reg [15:0] sequence = 16'b0001011011100000; // Sample input sntream
  integer i;

  initial begin
    $display("Time\tclk\trst\tx\tz\tstate");
    $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, rst, x, z);

    // Dump waveform
    $dumpfile("moore1011.vcd");
    $dumpvars(0, moore1011_tb);

    // Initialize
    clk = 0;
    rst = 1;
    x = 0;
    #10;

    rst = 0; // De-assert reset

    // Feed sequence bit by bit on each clock
    for (i = 15; i >= 0; i = i - 1) begin
      @(posedge clk); // Change input at posedge
      x = sequence[i];
    end

    #50;
    $finish;
  end

endmodule
