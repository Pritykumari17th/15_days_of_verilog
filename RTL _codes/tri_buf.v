


module tri_buf(
    input in,
    input ctrl,
    output y
);

    assign y = ctrl ? in : 1'bz;

endmodule
