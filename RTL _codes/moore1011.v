


module moore1011(
  input clk,
  input rst,
  input x,
  output reg z
);

  reg [2:0] state;

  // State encoding
  parameter init  = 3'd0,
            s1    = 3'd1,
            s10   = 3'd2,
            s101  = 3'd3,
            s1011 = 3'd4;

  // Sequential block: state transitions
  always @(posedge clk) begin
    if (rst)
      state <= init;
    else begin
      case (state)
        init:   state <= x ? s1   : init;
        s1:     state <= x ? s1   : s10;
        s10:    state <= x ? s101 : init;
        s101:   state <= x ? s1011: s10;
        s1011:  state <= x ? s1   : s10;
        default: state <= init;
      endcase
    end
  end

  // Moore Output logic – depends only on current state
  always @(*) begin
    case (state)
      s1011: z = 1;
      default: z = 0;
    endcase
  end

endmodule



/*//my moore code
module moore1011(input clk, rst,x, output reg z);

reg [2:0]state;

parameter init = 3'd0, s1 = 3'd1, s10 = 3'd2, s101 = 3'd3, s1011 = 3'd4;

always @(posedge clk)begin
if(rst)begin
state <= init;
z <= 0;
end
else begin
case (state)
init : begin
state <= x ? s1 : init;
z <= 1'b0;
end
s1 : begin
state <= x ? s1 : s10;
z <= 1'b0;
end
s10 : begin
state <= x ? s101 : init;
z <= 1'b0;
end
s101 : begin
state <= x ? s1011 : s10;
z <= 1'b0;
end
s1011 : begin
z <= x ?1'b1 : 1'b0;
state <= x ? s1 : s10;
end

endcase
end
end
endmodule
*/
