
//Tff using Dff
module t_ff(input T, clk, rstn, output Q,Q_bar);

wire D, Q_internal;

assign D = T ^ Q_internal;


//instantiation
D_ff dut(.D(D),.clk(clk),.rstn(rstn),.Q_bar(Q_bar),.Q(Q_internal));

assign Q = Q_internal;

endmodule