module mux2_1(input a,b, s,output out);

assign out = (s==0)? a:b;

endmodule
