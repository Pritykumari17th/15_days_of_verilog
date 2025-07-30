

module sr_latch_tb;

reg s,r;
wire q,q_bar;


//initialize
sr_latch dut(.s(s),.r(r),.q(q),.q_bar(q_bar));
integer i ;
initial begin
$display("S\tR\tQ\tQ_bar");
$monitor("%b\t%b\t%b\t%b",s,r,q,q_bar);

//initial values
s = 1;
r = 0;
#2;

for(i = 0; i<4; i= i+1)begin
{s,r}= i;
#2;
end
#100 $finish;
end
endmodule
