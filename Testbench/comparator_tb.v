

module comparator_tb;

reg [3:0]A,B;
wire A_s_B, A_eq_B, A_l_B;

//instantiate
comparator dut(.A(A),.B(B),.A_s_B(A_s_B),.A_l_B(A_l_B),.A_eq_B(A_eq_B));

initial begin
$display("A\tB\tA_s_B\tA_eq_B,\tA_l_B");
$monitor("%b\t%b\t%b\t%b\t%b",A,B,A_s_B, A_eq_B, A_l_B);

//test case 1
A = 4'b01001; B = 4'b1110;
#1;

//test case 2
A = 4'b01011; B = 4'b1010;
#1;

//test case 3
A = 4'b01001; B = 4'b0110;
#1;

//test case 4
A = 4'b01101; B = 4'b1110;
#1;
//test case 5
A = 4'b1110; B = 4'b1110;

#1;
$finish;
end

endmodule
