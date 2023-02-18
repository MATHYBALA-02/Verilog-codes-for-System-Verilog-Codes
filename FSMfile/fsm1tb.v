module fsm_tb;
reg clk;
reg reset;
reg x;
wire y;
fsm dut(.clk(clk),.reset(reset),.x(x),.y(y));
initial begin
	clk=0;
	repeat (10) 
begin	
	#10 clk=~clk;
end
$finish;
end
initial begin
	reset=0;
	x=0;
	#10 reset=1;
end
initial begin
	$dumpfile("fsm1.vcd");
	$dumpvars();
end
initial begin
	x=0;
	#10 x=1;
	#10 x=0;
	#10 x=0;
	#10 x=1;
	#10 x=0;
	#10 $finish;
end
endmodule
