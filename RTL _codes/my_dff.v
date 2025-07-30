

module D_ff(input D,rstn,clk,output reg Q, Q_bar);

always @(posedge clk) begin

if(!rstn)begin
Q <= 1'b0;
Q_bar <= 1'b1;
end
else begin
Q <= D;
Q_bar <= ~D;
end

end

endmodule
