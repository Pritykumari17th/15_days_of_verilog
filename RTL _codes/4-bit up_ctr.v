

module up_ctr(input rst,clk,output reg [3:0]cnt);

always @(posedge clk or posedge rst) begin
if(rst)
// up counter
cnt <= 4'd0;
//down counter
//cnt <= 4'b1111;

else
cnt <= (cnt+4'd1);
//to ignore this synthsis warning we can also write in these 2 ways shown below:
// 1.-> cnt <= (cnt + 1) & 4'b1111;
// 2.-> cnt <= (cnt+1) %16; //both are equivalent


//down counter
//cnt <= (cnt - 4'd1);
end
endmodule

