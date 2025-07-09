


module mux_dec_buff(
    input [3:0] in,
    input s1, s0,
    output wor y   // Make output wired-OR!
);

    wire [3:0] out;

    // Instantiate decoder
    dec2to4 dut(.A(s1), .B(s0), .y(out));

    // Directly connect buffers to output 'y'
    tri_buf t0(.in(in[0]), .ctrl(out[0]), .y(y));
    tri_buf t1(.in(in[1]), .ctrl(out[1]), .y(y));
    tri_buf t2(.in(in[2]), .ctrl(out[2]), .y(y));
    tri_buf t3(.in(in[3]), .ctrl(out[3]), .y(y));

endmodule
