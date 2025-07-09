
//structural modeling using binary encoder
module pri_encoder_8to3(input [7:0]in, output [2:0]y);

wire [7:0]w;

//instantiation

bi_encoder dut(.in(w),.y(y));
/*
 assign w[0] = in[0]&~in[1]&~in[2]&~in[3]&~in[4]&~in[5]&~in[6]&~in[7]; 
 assign w[1] = in[1]&~in[2]&~in[3]&~in[4]&~in[5]&~in[6]&~in[7];
 assign w[2] = in[2]&~in[3]&~in[4]&~in[5]&~in[6]&~in[7];
 assign w[3] = in[3]&~in[4]&~in[5]&~in[6]&~in[7];
 assign w[4] = in[4]&~in[5]&~in[6]&~in[7];
 assign w[5] = in[5]&~in[6]&~in[7];
 assign w[6] = in[6]&~in[7];
 assign w[7] = in[7];
 */
 
 //Instead of writing the above long code we can directly use "REDUCTION OPERATOR"
 // same result, shorter and clearer
 
 assign w[0] = in[0] & ~|in[7:1]; 
 assign w[1] = in[1] & ~|in[7:2];
 assign w[2] = in[2] & ~|in[7:3];
 assign w[3] = in[3] & ~|in[7:4];
 assign w[4] = in[4] & ~|in[7:5];
 assign w[5] = in[5] & ~|in[7:6];
 assign w[6] = in[6] & ~in[7];
 assign w[7] = in[7];

endmodule
 