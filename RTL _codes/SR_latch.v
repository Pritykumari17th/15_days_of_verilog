

module sr_latch(input s,r,output q,q_bar);

nor n1(q_bar,s,q);
nor n2(q,r,q_bar);

endmodule
