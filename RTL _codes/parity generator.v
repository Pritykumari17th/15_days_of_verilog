


module parity_generator(input [3:0]in, input ctrl,output reg even_parity,odd_parity);

always @(*)begin
if(ctrl)
even_parity <= ^in;
else
odd_parity <= ~^in;

end
endmodule
