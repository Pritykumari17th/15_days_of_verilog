

module dff_tb;

reg D, clk, rstn;
wire Q,Q_bar;

//instantiation
D_ff dut(.D(D),.clk(clk),.rstn(rstn),.Q_bar(Q_bar),.Q(Q));

// clock generation
always #5 clk = ~clk;


initial begin
clk =0;
rstn = 0;
D = 0;
$display("Time\tResetn\tD\tQ\tQ_bar");
$monitor("%t\t%b\t%b\t%b\t%b",$time,rstn,D,Q,Q_bar);

#10;
rstn = 1;
#10;

repeat(4) begin
@(posedge clk);
D = $random % 2 ;
end


#10;
rstn = 0;
#10;
rstn = 1;
repeat(4) begin
@(posedge clk);
D = $random % 2 ;
end

#100 $finish;

end
endmodule
