

module pri_encoder_8to3_tb;

  reg [7:0] in;
  wire [2:0] y;

  // DUT instantiation
  pri_encoder_8to3 dut (.in(in), .y(y));

  integer i;

  initial begin
    $display("Time\tInput\t\tOutput");
    $monitor("%0t\t%b\t%b", $time, in, y);

    // Test 1: Single '1' from LSB to MSB
    for (i = 0; i < 8; i = i + 1) begin
      in = 8'b00000000;
      in[i] = 1'b1;
      #2;
    end

    // Test 2
    in = 8'b00010001; // both in[4] and in[0] are high → y = 100
    #2;

    in = 8'b11000000; // in[7] and in[6] are high → y = 111
    #2;

    in = 8'b00000000; // all 0s → y = xxx (undefined)
    #2;

    $finish;
  end

endmodule
