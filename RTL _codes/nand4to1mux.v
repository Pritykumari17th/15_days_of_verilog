

//This code is not working fine

module nand_4to1_mux(input a, b, c, d, s1, s0, output y);

  // Inverted select lines
  wire ns1, ns0;
  nand(ns1, s1, s1);
  nand(ns0, s0, s0);

  // Create selection signals
  wire a_sel1, a_sel2, a_sel3, a_out;
  nand(a_sel1, a, ns1);
  nand(a_sel2, a_sel1, ns0);
  nand(a_out, a_sel2, a_sel2); // a & ~s1 & ~s0

  wire b_sel1, b_sel2, b_out;
  nand(b_sel1, b, ns1);
  nand(b_sel2, b_sel1, s0);
  nand(b_out, b_sel2, b_sel2); // b & ~s1 & s0

  wire c_sel1, c_sel2, c_out;
  nand(c_sel1, c, s1);
  nand(c_sel2, c_sel1, ns0);
  nand(c_out, c_sel2, c_sel2); // c & s1 & ~s0

  wire d_sel1, d_sel2, d_out;
  nand(d_sel1, d, s1);
  nand(d_sel2, d_sel1, s0);
  nand(d_out, d_sel2, d_sel2); // d & s1 & s0

  // Final OR using NANDs
  wire n1, n2, n3, n4;
  nand(n1, a_out, a_out);  // NOT a_out
  nand(n2, b_out, b_out);  // NOT b_out
  nand(n3, c_out, c_out);  // NOT c_out
  nand(n4, d_out, d_out);  // NOT d_out

  wire or1, or2;
  nand(or1, n1, n2);       // NAND(NOT a_out, NOT b_out)
  nand(or2, n3, n4);       // NAND(NOT c_out, NOT d_out)

  wire or1_final, or2_final;
  nand(or1_final, or1, or1);   // (a_out | b_out)
  nand(or2_final, or2, or2);   // (c_out | d_out)

  nand(y, or1_final, or2_final); // Final output: y

endmodule
