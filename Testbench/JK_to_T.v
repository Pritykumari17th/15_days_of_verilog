

module JKff_to_tff(input T,clk,rst,output reg Q);


jk_ff dut(.clk(clk),.rst(rst),.J(T),.K(T),.Q(Q));

endmodule