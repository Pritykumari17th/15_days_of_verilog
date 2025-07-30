
/*
module bi_directional_ctr(input rst,clk,dir,load,
input [3:0]l_data,
output reg [3:0]ctr);

always @(posedge clk) begin
if(rst)
ctr <= 4'b0000;
else if(load)
ctr <= l_data;
else if(dir)
ctr <= (ctr + 4'd1);
else 
ctr <= (ctr - 4'd1);
end
endmodule
*/

module bi_directional_ctr(
    input rst, clk, dir, load,
    input [3:0] l_data,
    output reg [3:0] ctr
);

always @(posedge clk) begin
    if (rst)
        ctr <= 4'b0000;
    else begin
        case ({load, dir}) // 2-bit case selector: {load, dir}
            2'b10: ctr <= l_data;       // load = 1 → load data
            2'b01: ctr <= ctr + 4'd1;   // load = 0, dir = 1 → count up
            2'b00: ctr <= ctr - 4'd1;   // load = 0, dir = 0 → count down
            default: ctr <= ctr;        // (load=1, dir=1) – optional handling
        endcase
    end
end

endmodule
