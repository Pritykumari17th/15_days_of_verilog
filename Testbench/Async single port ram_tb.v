

module async_single_port_ram_tb;


reg [3:0]addr;
reg we,enable;
wire [7:0]data;
reg [7:0]tempd;

integer l;

Async_single_port_ram dut(.we_in(we),.enable_in(enable),.addr_in(addr),.data(data));

assign data = (we && !enable) ? tempd : 8'hzz;

task initialize();
begin
we = 1'b0;
enable = 1'b0;
tempd = 3'h00;
end
endtask

task stimulus(input [3:0]i, input [7:0]j);
begin
addr = i;
tempd = j;
end
endtask

task write();
begin
we = 1'b1;
enable = 1'b0;
end
endtask

task read();
begin
we = 1'b0;
enable = 1'b1;
end
endtask

task delay;
begin
#10;
end
endtask

initial begin

initialize;
delay;
write;
for(l = 0;l<16;l=l+1)begin
stimulus(l,l);
delay;
end

delay;
read;
for(l = 0;l<16;l=l+1)begin
stimulus(l,0);
delay;
end


delay;
$finish;
end

initial begin
$monitor("values of addr = %d, data = %d", addr,data);
end

endmodule




