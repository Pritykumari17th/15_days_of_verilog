

module dec2to4(
    input A, B,
    output [3:0] y
);

    assign y[0] = ~A & ~B;
    assign y[1] = ~A &  B;
    assign y[2] =  A & ~B;
    assign y[3] =  A &  B;

endmodule
