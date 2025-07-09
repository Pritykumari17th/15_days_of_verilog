

module nand_dec2to4(input a,b,en, output [3:0]y);

wire na,nb,nen;
wire w0,w1,w2,w3;

// inverting the inputs a and b
assign na = ~(a & a );
assign nb = ~(b&b);

// assigning wired o/p of decoder with nand logic

assign w0 = ~(na & nb & en);
assign w1 = ~(na & b & en);
assign w2 = ~(a & nb & en);
assign w3 = ~(a & b & en);

// now making active-low to active- high

assign y[0] = ~(w0 & w0);
assign y[1] = ~(w1 & w1);
assign y[2] = ~(w2 & w2);
assign y[3] = ~(w3 & w3);

endmodule
