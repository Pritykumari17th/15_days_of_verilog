

module dec3to8_behv_tb;

reg [2:0]in;
reg en;
wire [7:0]out;

//instantiation
dec3to8_behv dut(.in(in),.en(en),.out(out));

task initialize;
begin
en =0;
#5;
en = 1;
end
endtask

integer i;

initial begin

$display("enable\tinputs\toutput");
$monitor("%b\t%b\t%b",en,in,out);
initialize();
for(i=0;i<8;i=i+1)begin
in = i;
#2;
end

#3 $finish;
end
endmodule
