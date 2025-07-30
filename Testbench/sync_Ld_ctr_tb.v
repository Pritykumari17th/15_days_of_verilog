

module sync_4bit_ctr_tb;

  reg clk, rst, load;
  reg [3:0] l_data;
  wire [3:0] ctr;

  // Instantiate the DUT
  sync_4bit_ctr dut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .l_data(l_data),
    .ctr(ctr)
  );

  // Clock Generation: 10 time unit period
  always #5 clk = ~clk;
  
  task initialize();
  begin
  clk = 0;
  rst = 1;
  load = 0;
  l_data = 4'd0;
  end
  endtask
  //In Verilog, time delays like #10 must be evaluated at compile time.
  // If the delay is passed as a parameter, it must be an integer or time type.
  task loading(input [3:0]data, input integer delay);
  begin
  load = 1;
  l_data = data;
  #(delay);
  load = 0;
  end
  endtask
  
  task reset();
  begin
  rst = 1;
  #10 rst = 0;
  end
  endtask

  initial begin
    $display("\tTime\tclk\trst\tload\tl_data\tctr");
    $monitor("%0t\t%b\t%b\t%b\t%0d\t%0d", $time, clk, rst, load, l_data, ctr);
    
    // Initial values
    //clk = 0; rst = 1; load = 0; l_data = 4'b0000;
	 initialize();
	 reset();
    // Hold reset
    //#10 rst = 0;

    // Allow counter to count
    #50;

    // Load value
   // load = 1; l_data = 4'd9;
    //#10 load = 0;
	 
	 loading(4'd9, 10);
	 
    // Observe counting from loaded value
    #60;

    // Assert reset again
   // rst = 1;
    //#10 rst = 0;
	 reset();
	
    // Finish simulation
    #20 $finish;
	 
  end

endmodule
