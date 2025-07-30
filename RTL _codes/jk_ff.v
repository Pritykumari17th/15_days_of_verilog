

module jk_ff(input clk, rst, j, k, output reg q, output q_bar);

parameter HOLD = 2'd0, SET = 2'd1, RESET = 2'd2, TOGGLE = 2'd3;

assign q_bar = ~q;

always @(posedge clk) begin
  if (rst)
    q <= 0;
  else begin
    case ({j, k})
      HOLD   : q <= q;       // 2'b00
      SET    : q <= 1;       // 2'b10
      RESET  : q <= 0;       // 2'b01
      TOGGLE : q <= ~q;      // 2'b11
    endcase
  end
end

endmodule
