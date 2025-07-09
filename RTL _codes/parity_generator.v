

module parity_gen(input [3:0]in, output even_parity,odd_parity);

assign even_parity = ^in;
assign odd_parity = ~^in;

endmodule

