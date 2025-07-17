

module majority_voter_tb;

reg A,B,C,D,E;
wire y;

//instantation
majority_voter dut(A,B,C,D,E,y);

integer i;

initial begin
$display("A\tB\tC\tD\tE\tY");
$monitor("%b\t%b\t%b\t%b\t%b\t%b",A,B,C,D,E,y);

for(i = 0; i<32; i=i+1)begin
{A,B,C,D,E} = i;
#5;
end
#30 $finish;
end
endmodule

