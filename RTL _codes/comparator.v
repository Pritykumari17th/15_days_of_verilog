

module comparator(input [3:0]A,B, output A_s_B, A_eq_B, A_l_B);

assign A_s_B = A > B;
assign A_l_B = (A < B);
assign A_eq_B = (A == B);

endmodule

