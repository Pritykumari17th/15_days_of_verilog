

module mux4to1dec_tb;

    reg [3:0] in;
    reg s1, s0;
    wire y;

    integer i;

    // Instantiate the DUT
    mux_dec_buff dut(.in(in), .s1(s1), .s0(s0), .y(y));

    initial begin
        in = 4'b1101;  // in[3]=1, in[2]=1, in[1]=0, in[0]=1
        s1 = 0; s0 = 0;

        $display("in = %b", in);
        $display("sel\ty");
        $monitor("%b%b\t%b", s1, s0, y);

        for (i = 0; i < 4; i = i + 1) begin
            {s1, s0} = i;
            #3;
        end

        #2 $finish;
    end

endmodule
