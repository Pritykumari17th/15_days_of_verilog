



module jk_ff_tb;

reg clk, rst, j, k;
wire q, q_bar;

// Instantiate the JK flip-flop
jk_ff dut (.clk(clk), .rst(rst), .j(j), .k(k), .q(q), .q_bar(q_bar));

// Clock generation
always #5 clk = ~clk;

// Task to initialize signals
task initialize;
begin
  clk = 0;
  j = 0;
  k = 0;
  rst = 0;
end
endtask

// Task to apply reset
task reset;
begin
  rst = 1;
  repeat(2) @(posedge clk);
  rst = 0;
end
endtask

// Task to apply inputs
task din;
  input a, b;
  begin
    @(posedge clk);
    j = a;
    k = b;
  end
endtask

initial begin
  $display("Time\tRST\tJ\tK\tQ\tQ_bar");
  $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, rst, j, k, q, q_bar);

  initialize();
  reset();

  din(0,0);  // HOLD
  din(0,1);  // RESET
  din(1,0);  // SET
  din(1,1);  // TOGGLE
  din(1,1);  // TOGGLE again

  #30 $finish;
end

endmodule
