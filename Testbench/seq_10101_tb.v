

//`timescale 1ns/1ps
module seq_10101_tb;

  reg clk, rst, in;
  wire z_out;

  // Instantiate the FSM
  seq_10101 dut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .z_out(z_out)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    in = 0;

    // Reset pulse
    #10 rst = 0;

    $display("\n--- Applying Sequence 1: 101010010101 ---");
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;

    #20;

    $display("\n--- Applying Sequence 2: 101010101 ---");
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;
    in = 0; #10;
    in = 1; #10;

    #20;
    $finish;
  end

  // Monitor all signal changes
  initial begin
    $display("Time\trst\tin\tz_out");
    $monitor("%0t\t%b\t%b\t%b", $time, rst, in, z_out);
  end

endmodule
