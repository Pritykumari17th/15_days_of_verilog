

module dual_port_RAM_tb;

reg rst,clk,rd_en,w_en;
reg [7:0]w_data;
reg [3:0]rd_addr,w_addr;

wire [7:0]rd_data;

//instantiation
dual_port_RAM dut(.rst(rst),.clk(clk),.rd_en(rd_en),.wr_en(w_en),.w_addr(w_addr),.w_data(w_data),.rd_addr(rd_addr),.rd_data(rd_data));

//reg [7:0]mem[15:0];

always #5 clk = ~clk;

task initialize();
begin
clk = 0;
w_en = 0;
rd_en = 0;
rd_addr = 0;
w_addr = 0;
w_data = 0;
end
endtask

task reset();
begin
rst = 1;
@(posedge clk);
@(posedge clk);
rst = 0;
end
endtask

task print;
begin
  $display("Time=%0t | clk=%b rst=%b | w_en=%b w_addr=%0d w_data=%0d | rd_en=%b rd_addr=%0d rd_data=%0d",
            $time, clk, rst, w_en, w_addr, w_data, rd_en, rd_addr, rd_data);
end
endtask

task write(input [3:0]addr,input [7:0]data);
begin
@(posedge clk);
w_en = 1;
@(negedge clk);
w_addr = addr;
w_data = data;
@(negedge clk);
w_en = 0;
print();
end
endtask

task read(input [3:0]addr);
begin
@(posedge clk);
rd_en = 1;
@(negedge clk);
rd_addr = addr;

@(negedge clk);
 rd_en = 0;
 print();
end
endtask

integer i ;
reg [3:0]a;
reg [7:0]d;

initial begin

initialize();
reset();


for(i = 0;i<10;i = i+1)begin

a = $random%16;
d = $random%256;
write(a,d);
#5;
read(a);
end

  #50 $finish;

end

endmodule
