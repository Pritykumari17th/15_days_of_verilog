

module mux4to1(input wire A,B,C,D,
input wire s1,s0,
output reg y);

always @(*)begin
case ({s1,s0})
2'b00 : y <= A;
2'b01 : y <= B;
2'b10 : y <= C;
2'b11: y <= D;
default : y <= 1'b0;
endcase
end
endmodule
 