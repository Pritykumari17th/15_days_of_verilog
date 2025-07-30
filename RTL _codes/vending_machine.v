


module vending_machine(input i,j,clk,rst_n,output reg x,y);

parameter s0 = 2'b00,
					s1 = 2'b01,
					s2 = 2'b10;

reg [1:0]state,next_state;

always @(posedge clk or negedge rst_n)begin
if(!rst_n)
state <= s0;
else
state <= next_state;
end

always @(*)begin
next_state = state;
//{x,y} = {0,0};

case (state)
s0 : begin
case({i,j})
2'b10 : next_state = s1;
2'b11 : next_state = s2;
endcase
end

s1 : begin
case({i,j})
2'b10 : next_state = s2;
2'b11 : next_state = s0;
endcase
end

s2 : begin 
case ({i,j})
2'b10 : next_state = s0;
2'b11 : next_state = s0;
endcase
end
endcase
end

always @(posedge clk or negedge rst_n)begin
if(!rst_n)
{x,y} <= {1'b0,1'b0};
else
begin
{x,y} <= {1'b0,1'b0};
case(state)
s1: begin
case({i,j})
2'b11 : {x,y} <= {1'b1,1'b0};
endcase
end
s2 : begin
case({i,j})
2'b10 : {x,y} <= {1'b1,1'b0};
2'b11 : {x,y} <= {1'b1,1'b1};
endcase
end
endcase
end
end
endmodule
