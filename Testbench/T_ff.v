

module tff(input clk,rst,T,output reg Q);

always @(posedge clk or posedge rst)begin
if(rst)
Q <= 1'b0;
else if(T)
Q <= ~Q;
end

endmodule