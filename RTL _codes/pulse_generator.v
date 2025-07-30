
//the pulse generator logic can be same as rising edge detector

module pulse_generator(
    input clk,
    input trigger,
    output reg pulse
);

reg trigger_d;

always @(posedge clk) begin
    trigger_d <= trigger;
    pulse <= trigger & ~trigger_d; // rising edge pulse
end
endmodule
