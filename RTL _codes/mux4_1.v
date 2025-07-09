module mux4_1(input [3:0]in,
							input s1,s0, 
							output out);

wire w1,w2;

//instantiate

mux2_1 dut(.a(in[0]),.b(in[1]),.s(s0),.out(w1));
mux2_1 dut1(.a(in[2]),.b(in[3]),.s(s0),.out(w2));

mux2_1 dut2(.a(w1),.b(w2),.s(s1),.out(out));


endmodule
