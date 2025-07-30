

module vending_machine_tb;

  reg i, j;
  reg clk, rst_n;
  wire x, y;

  // Instantiate the DUT
  vending_machine dut (
    .i(i),
    .j(j),
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .y(y)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Task to insert coin
  task insert_coin(input reg ci, input reg cj);
  begin
    {i, j} = {ci, cj};
    #10;
    {i, j} = 2'b00;  // simulate removing hand
    #10;
  end
  endtask

  initial begin
    $display("Starting simulation...");
    $monitor("Time=%0t | i=%b j=%b | x=%b y=%b | state=%0d", $time, i, j, x, y, dut.state);

    clk = 0;
    rst_n = 0;
    i = 0;
    j = 0;
    #12;
    rst_n = 1;

    // 1 + 1 + 1 = 3 (Expect x=1, y=0)
    insert_coin(1, 0);  // 1
    insert_coin(1, 0);  // 1
    insert_coin(1, 0);  // 1

    // 2 + 1 = 3 (Expect x=1, y=0)
    insert_coin(1, 1);  // 2
    insert_coin(1, 0);  // 1

    // 2 + 2 = 4 (Expect x=1, y=1)
    insert_coin(1, 1);  // 2
    insert_coin(1, 1);  // 2

    // 1 + 2 = 3 (Expect x=1, y=0)
    insert_coin(1, 0);  // 1
    insert_coin(1, 1);  // 2

    // No coin inserted
    #20;

    $display("Simulation completed.");
    $finish;
  end

endmodule
