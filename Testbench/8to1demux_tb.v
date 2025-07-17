

module demux1to8_tb;

reg in,en;
reg [2:0]sel;
wire [7:0]y;

//instantiate

demux1to8 dut(in, en,sel,y);
integer i;
initial begin
$display("sel\t in\toutput");
$monitor("%b\t%b\t%b", sel,in,y);
en = 1;
for(i=0;i<8;i=i+1)begin
sel = i;
in=0;
#1
in = 1;
#1;
end
#1 $finish;
end
endmodule

