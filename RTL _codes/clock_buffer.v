

module clock_buffer(input mclk,output bclk);

buf buff(bclk,mclk);

endmodule
