

module bidir_ctr_tb;

reg rst,clk,dir,load;
reg [3:0]l_data;
wire [3:0]ctr;

//initialize
bi_directional_ctr dut(rst,clk,dir,load,l_data,ctr);

always #2 clk = ~clk;

initial begin
$display("\tTime\trst\tdir\tload\tl_data\tctr");
$monitor("%0t\t%b\t%b\t%b\t%0d\t%0d", $time, rst, dir, load, l_data, ctr);
rst = 1;
clk = 0;
dir = 1;
load = 0;
l_data = 4'd10;
//#2;clk toggles every 2 units ⇒ posedge at 2ns, 6ns, 10ns,...
//But you de-assert rst = 0 exactly at 2ns, the same time when clk becomes 1.
//So at the first posedge clk, rst = 0 — the FSM misses the reset!
//Thus, ctr was never reset, so it remains x.
//****Fix: Hold rst = 1 longer or use async reset (posedge rst).****
#5;
rst = 0;
//up counting 
#10;
dir = 0;//down counting
#30 rst= 1;
#4 rst = 0;
dir =1;
#4;
load = 1;
#4 load =0;


#100 $finish;

end

endmodule
