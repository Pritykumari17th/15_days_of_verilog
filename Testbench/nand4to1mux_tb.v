


module tb_nand_4to1_mux;

  reg a, b, c, d;
  reg s1, s0;
  wire y;

  nand_4to1_mux dut (
    .a(a), .b(b), .c(c), .d(d),
    .s1(s1), .s0(s0),
    .y(y)
  );

  initial begin
    $display("Time | s1 s0 | a b c d | y");
    $monitor("%4t |  %b  %b | %b %b %b %b | %b", $time, s1, s0, a, b, c, d, y);

    a = 1; b = 0; c = 0; d = 1;
    s1 = 0; s0 = 0; #10; // y = a = 1
    s1 = 0; s0 = 1; #10; // y = b = 0
    s1 = 1; s0 = 0; #10; // y = c = 0
    s1 = 1; s0 = 1; #10; // y = d = 1

    a = 0; b = 1; c = 1; d = 0;
    s1 = 0; s0 = 0; #10; // y = a = 0
    s1 = 0; s0 = 1; #10; // y = b = 1
    s1 = 1; s0 = 0; #10; // y = c = 1
    s1 = 1; s0 = 1; #10; // y = d = 0

    $finish;
  end

endmodule
