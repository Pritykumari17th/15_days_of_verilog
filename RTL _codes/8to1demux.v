
//1to8 Demux using behavioural level modeling

module demux1to8(in, en,sel,y);

input in;
input en;
input [2:0]sel;
output reg [7:0]y; 

 always @(*)begin
  y  = 8'b00000000;
 if(en)begin
 case(sel)
 3'b000 : y[0] = in;
 3'b001 : y[1] = in;
 3'b010 : y[2] = in;
 3'b011 : y[3] = in;
 3'b100 : y[4] = in;
 3'b101 : y[5] = in;
 3'b110 : y[6] = in;
 3'b111 : y[7] = in;
 default : begin
 y  = 8'b00000000;
 end
 endcase
 end
 end
 endmodule
 