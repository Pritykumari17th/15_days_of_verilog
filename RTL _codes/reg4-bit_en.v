

//4-bit register with enable
module reg_4bit(input rstn, clk, en,
input [3:0] in,
output reg [3:0]Q);

always @(posedge clk or negedge rstn) begin
if(!rstn)
Q <= 4'b0000;
else if (en)
Q <= in;
//else hold previous value (do nothing)
end

endmodule
