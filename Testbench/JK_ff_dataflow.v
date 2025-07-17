

module jk_ff(input clk,rst,J,K,output reg Q);

always @(posedge clk or negedge rst)begin
if(!rst)
Q <= 1'b0;
//else if(~J & ~K) //if nothing changes, Q automatically holds its value — no need to reassign it.
//Q <= Q;
else if(~J & K)
Q <= 1'b0;
else if(J & ~K)
Q <= 1'b1;
else if(J & K)
Q <= ~Q;
end

endmodule
