

module en_dff(input en,rst,D,output reg q);

always @(posedge clk or negedge rst)begin
if(!rst)
q <= 1'b0;
else if(en)
q <= D;
end
endmodule
