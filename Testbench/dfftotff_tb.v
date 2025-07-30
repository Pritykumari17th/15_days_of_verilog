


module tff_tb;

reg T, clk, rstn;
wire Q,Q_bar;

//instantiation
t_ff dut(.T(T),.clk(clk),.rstn(rstn),.Q_bar(Q_bar),.Q(Q));

// clock generation
always #5 clk = ~clk;


initial begin
clk =0;
rstn = 0;
T = 0;
$display("Time\tResetn\tT\tQ\tQ_bar");
$monitor("%t\t%b\t%b\t%b\t%b",$time,rstn,T,Q,Q_bar);

#10;
rstn = 1;
#10;

repeat(4) begin
@(posedge clk);
T = $random % 2 ;
end


#10;
rstn = 0;
#10;
rstn = 1;
repeat(4) begin
@(posedge clk);
T = $random % 2 ;
end

#100 $finish;

end
endmodule