

module edge_detector(input clk, signal,output reg edge_detector);

reg temp;

always @(posedge clk)begin
temp <= ~signal; // here temp store the previous complemented value of signal.
edge_detector <= (signal & temp);// if present value of signal is 1 and previous valuewas 0 then ithe edge is detected and becomes high.
end
endmodule
