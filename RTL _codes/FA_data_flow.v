
module FA_data_flow(input a_in,b_in,c_in,output sum_out,carry_out);
	
	
assign sum_out = a_in^b_in^c_in;
assign carry_out = (a_in&b_in) | (c_in &(a_in^b_in));

endmodule
