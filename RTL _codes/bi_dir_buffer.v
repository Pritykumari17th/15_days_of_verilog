
module bibuff(inout a,b,input En);

bufif1 (a,b,En);
bufif0 (b,a,En);

endmodule


/*
module bidir_buffer(
  inout wire line,         // shared bidirectional line
  input wire dir,          // direction control
  input wire data_out,     // to write to line
  output wire data_in      // to read from line
);

  assign line     = (dir) ? data_out : 1'bz; // output mode
  assign data_in  = line;                    // read from bus

endmodule
*/