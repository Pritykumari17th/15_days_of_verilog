

module dec_3_8(input [2:0]in,
input En,
output [7:0]out);

/*
genvar i;
generate
for(i=0; i<8;i=i+1)begin
assign out[i] = (in == i);
end
endgenerate
*/

//we can also use 1-hot 
//simple and clear

assign out = En ? (8'b00000001<< in) : 8'b00000000;

endmodule
