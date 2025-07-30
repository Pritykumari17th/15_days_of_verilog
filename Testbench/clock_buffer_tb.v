

module clock_buffer_tb;

reg mclk;
wire bclk;

time t1,t2,t3,t4,t5,t6;

clock_buffer dut(mclk,bclk);

initial mclk = 0;
always #5 mclk = ~ mclk;

task measure_mclk;
begin
@(posedge mclk);
t1 = $time;
@(posedge mclk);
t3 = $time;
end
endtask

task measure_bclk;
begin
@(posedge bclk);
t2 = $time;
@(posedge bclk);
t4 = $time;
end
endtask

initial begin
fork
measure_mclk;
measure_bclk;
join

if((t1==t2)&& (t3 == t4))
$display("Phase is same");
else
$display("Phase is different");


//calculating frequency difference
t5 = t3-t1;
t6 = t4-t2;

if(t5 == t6)
$display("frequency is same");
else
$display("frequencyis different");

#50 $finish;
end
endmodule
