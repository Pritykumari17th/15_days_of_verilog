module seq_10101(input clk, rst, in, output reg z_out);

  parameter s0 = 3'b000,
            s1 = 3'b001,
            s2 = 3'b010,
            s3 = 3'b011,
            s4 = 3'b100;

  reg [2:0] state, next_state;

  // Next state logic
  always @(*) begin
    case(state)
      s0: next_state = in ? s1 : s0;
      s1: next_state = in ? s1 : s2;
      s2: next_state = in ? s3 : s0;
      s3: next_state = in ? s1 : s4;
      s4: next_state = in ? s1 : s0;
      default: next_state = s0;
    endcase
  end

  // State update
  always @(posedge clk or posedge rst) begin
    if (rst)
      state <= s0;
    else
      state <= next_state;
  end

  // Output logic
  always @(posedge clk or posedge rst) begin
    if (rst)
      z_out <= 0;
    else if (state == s4 && in == 1)
      z_out <= ~z_out;  // Toggle on full match
  end

endmodule
