

module nor_dec2to4(input a,b,en,output [3:0]y);

wire na,nb;

assign na = ~(a|a);
assign nb = ~(b|b);

//Decoder 
assign y[0] = ~(a | b) & en;
assign y[1] = ~(a | nb) & en;
assign y[2] = ~(na | b) & en;
assign y[3] = ~(na | nb) & en;

endmodule

