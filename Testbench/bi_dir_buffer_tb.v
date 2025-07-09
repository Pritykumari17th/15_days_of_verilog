
module bibuff_tb;

reg En;
wire a,b;


//instantiation
bibuff dut(a,b,En);

reg temp1,temp2;
integer i;

initial begin
$display("temp1\ttemp2\tEn\ta\tb");
$monitor("%b\t%b\t%b\t%b\t%b", temp1, temp2, En, a, b);

for(i=0 ; i<8; i=i+1)begin
{temp1,temp2,En} = i;
#1;
end
#100 $finish;
end

assign b = En ? temp1: 1'bz;
assign a = ~En ? temp2 : 1'bz;

endmodule




/*
module bidir_buffer_tb;

reg dir;
reg data_out;
wire line;
wire data_in;

reg external_driver; // for read testing
assign line = (!dir) ? external_driver : 1'bz;

//instantiation
bidir_buffer dut(.dir(dir),.line(line),.data_in(data_in),.data_out(data_out));

initial begin
$display("dir\tdata_out\tline\tdata_in");
$monitor("%b\t%b\t%b\t%b",dir,data_out,line,data_in);

dir = 1; data_out = 1;
#1;
dir = 1; data_out = 0;
#1;
dir = 0; external_driver = 1;
#1;
dir = 0; external_driver = 0;
#1;

$finish;

end
endmodule
*/