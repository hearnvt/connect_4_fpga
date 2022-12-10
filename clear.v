module clear(clk, rst, x, y, colour);
	input clk;
	input rst;
	output reg [7:0]x;
	output reg [7:0]y;
	output reg [2:0]colour;
	
	
	integer xpos;
	integer ypos;
	
	
always@(posedge clk)
begin
	
	xpos <= xpos + 1'b1;
	
	if (xpos == 320)
	begin
		ypos <= ypos + 1'b1;
		xpos <= 1'b0;
	end
	if (ypos == 241)
	begin
		ypos <= 0;
	end
	
	
	x <= xpos;
	y <= ypos;
	colour <= 3'b000;
	
end
endmodule