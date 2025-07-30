

module mod_12_4bit_tb;

  reg clk, rst, load;
  reg [3:0] l_data;
  wire [3:0] ctr;

  // Instantiate DUT
  mod_12_4bit dut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .l_data(l_data),
    .ctr(ctr)
  );

  // Generate clock: 10 time unit period
  always #5 clk = ~clk;

  initial begin
    $display("\tTime\tclk\trst\tload\tl_data\tctr");
    $monitor("%0t\t%b\t%b\t%b\t%0d\t%0d", $time, clk, rst, load, l_data, ctr);

    // Initial values
    clk = 0; rst = 1; load = 0; l_data = 4'b0000;

    // Deassert reset
    #10 rst = 0;

    // Let counter increment up to 11
    #70;

    // Load value 7
    load = 1; l_data = 4'd7;
    #10 load = 0;

    // Wait to see if it counts from 7
    #50;

    // Assert reset
    rst = 1;
    #10 rst = 0;

    #20 $finish;
  end

endmodule
