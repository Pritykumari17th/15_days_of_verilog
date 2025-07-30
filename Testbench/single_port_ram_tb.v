

module sync_single_port_ram_tb;

reg clk, rst,wr_rd_en;
reg [3:0]rd_addr,wr_addr;
wire [7:0]data;

//instantiate 
sync_single_port_ram dut(.clk(clk),.rst(rst),.wr_rd_en(wr_rd_en),.rd_addr(rd_addr),.wr_addr(wr_addr),.data(data));

always #5 clk = ~clk;

reg [7:0]data_in;//temporary reg to drive data

assign data = wr_rd_en ? data_in : 8'bz;// here when wr_rd_en is "1" so tebtbench will drive data to dut, else it will have high impedence"z".

task initialize();
begin
clk = 0;
rst = 1;
wr_rd_en =0;
wr_addr = 0;
data_in = 0;
@(posedge clk);
 rst = 0;
end
endtask

task write();
begin
wr_rd_en = 1;
wr_addr = ($random)%16;
data_in = ($random)%256;

@(posedge clk);
$display("Write at address %0h = %0h",wr_addr,data_in);
end
endtask

task read();
begin
wr_rd_en = 0;
rd_addr = $random%16;
repeat(2)
@(posedge clk);
$display("Read at address %0h = %0h",rd_addr,data);
end 
endtask


initial begin
initialize();

//Write at 5 random locations
repeat(5)
write();

//Read at 5 random locations
repeat(5)
read();

@(posedge clk) $finish;
end
endmodule



