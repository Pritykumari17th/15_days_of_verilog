

//Majority voter

module majority_voter(input A,B,C,D,E,output reg y);

always @(*)begin
if((A+B+C+D+E)> 2)
y = 1;
else
y = 0;
end
endmodule
