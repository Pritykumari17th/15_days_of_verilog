
module ripple_carry_adder(input [3:0]a,b, input c_in,
		  output [3:0]s, 
		  output carry_out);
		  
		  wire c0,c1,c2;		  
		  //instantiate
		  
		  FA_data_flow dut(.a_in(a[0]),.b_in(b[0]),.c_in(c_in),.sum_out(s[0]),.carry_out(c0));
		  FA_data_flow dut1(.a_in(a[1]),.b_in(b[1]),.c_in(c0),.sum_out(s[1]),.carry_out(c1));
		  FA_data_flow dut2(.a_in(a[2]),.b_in(b[2]),.c_in(c1),.sum_out(s[2]),.carry_out(c2));
		  FA_data_flow dut3(.a_in(a[3]),.b_in(b[3]),.c_in(c2),.sum_out(s[3]),.carry_out(carry_out));
		  
endmodule
		  
