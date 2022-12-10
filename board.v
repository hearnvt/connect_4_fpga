module board(clk, rst, x, y, colour, done, col);
	input clk, rst;
	output reg [7:0]x;
	output reg [7:0]y;
	output reg [2:0]colour;
	output reg done;
	output reg col;
	
	
	integer xpos = 36;
	integer ypos = 15;
	
	parameter	START = 2'b00,
					OUTLINE = 2'b01,
					VERT = 2'b10,
					HORI = 2'b11;
					
	reg [1:0]S;
	reg [1:0]NS;
	reg next;
	
	always@(posedge clk or negedge rst)
	begin
		if (rst == 1'b0)
			S <= START;
		else
			S <= NS;
	end
	
	always@(*)
	begin
		case (S)
			START:
			begin
				NS = OUTLINE;
			end
			
			OUTLINE:
			begin
				case (next)
					1'b1: NS = VERT;
					default: NS = OUTLINE;
				endcase
			end
			
			VERT:
			begin
				case (next)
					1'b0: NS = HORI;
					default: NS = VERT;
				endcase
			end
			
			HORI:
			begin
				NS = HORI;
			end
		endcase
	end
	
	always@(posedge clk)
	begin
	case (S)
		START:
		begin
			xpos <= 36;
			ypos <= 15;
			done <= 1'b0;
			col <= 1'b1;
			//colour <= 3'b000;
		end
		
		OUTLINE:
		begin
			if (xpos == 7'd35 && ypos == 7'd15)
			begin
				next <= 1'b1;
			end
			else if (xpos < 7'd105 && ypos == 7'd15)
			begin
				xpos <= xpos + 1'b1;
			end
			else if (xpos == 7'd105 && ypos < 7'd85)
			begin
				ypos <= ypos + 1'b1;
			end
			else if (xpos > 7'd35 && ypos == 7'd85)
			begin
				xpos <= xpos - 1'b1;
			end
			else if (xpos == 7'd35 && ypos > 7'd15)
			begin
				ypos <= ypos - 1'b1;
			end 
			
			col <= 1'b0;
			colour <= 3'b001;
			x <= xpos;
			y <= ypos;
		end
		
		VERT:
		begin
			
			if (xpos == 7'd95 && ypos == 7'd15)
			begin
				next <= 1'b0;
			end
			else if (xpos < 7'd45 && ypos == 7'd15)
			begin
				xpos <= 7'd45;
			end
			else if (xpos == 7'd45 && ypos < 7'd85)
			begin
				ypos <= ypos + 1'b1;
			end
			else if (xpos < 7'd55 && ypos == 7'd85)
			begin
				xpos <= 7'd55;
			end
			else if (xpos == 7'd55 && ypos > 7'd15)
			begin
				ypos <= ypos - 1'b1;
			end
			else if (xpos < 7'd65 && ypos == 7'd15)
			begin
				xpos <= 7'd65;
			end
			else if (xpos == 7'd65 && ypos < 7'd85)
			begin
				ypos <= ypos + 1'b1;
			end
			else if (xpos < 7'd75 && ypos == 7'd85)
			begin
				xpos <= 7'd75;
			end
			else if (xpos == 7'd75 && ypos > 7'd15)
			begin
				ypos <= ypos - 1'b1;
			end
			else if (xpos < 7'd85 && ypos == 7'd15)
			begin
				xpos <= 7'd85;
			end
			else if (xpos == 7'd85 && ypos < 7'd85)
			begin
				ypos <= ypos + 1'b1;
			end
			else if (xpos < 7'd95 && ypos == 7'd85)
			begin
				xpos <= 7'd95;
			end
			else if (xpos == 7'd95 && ypos > 7'd15)
			begin
				ypos <= ypos - 1'b1;
			end
			
			col <= 1'b1;
			x <= xpos;
			y <= ypos;
		end
		
		HORI:
		begin
			
			if (ypos == 7'd75 && xpos == 7'd35)
			begin
				done <= 1'b1;
			end
			else if (ypos == 7'd15 && xpos == 7'd95)
			begin
				ypos <= 7'd25;
				xpos <= 35;
			end
			else if (ypos == 7'd25 && xpos < 7'd105)
			begin
				xpos <= xpos + 1'b1;
			end
			else if (ypos < 7'd35 && xpos == 7'd105)
			begin
				ypos <= 7'd35;
			end
			else if (ypos == 7'd35 && xpos > 7'd35)
			begin
				xpos <= xpos - 1'b1;
			end
			else if (ypos < 7'd45 && xpos == 7'd35)
			begin
				ypos <= 7'd45;
			end
			else if (ypos == 7'd45 && xpos < 7'd105)
			begin
				xpos <= xpos + 1'b1;
			end
			else if (ypos < 7'd55 && xpos == 7'd105)
			begin
				ypos <= 7'd55;
			end
			else if (ypos == 7'd55 && xpos > 7'd35)
			begin
				xpos <= xpos - 1'b1;
			end
			else if (ypos < 7'd65 && xpos == 7'd35)
			begin
				ypos <= 7'd65;
			end
			else if (ypos == 7'd65 && xpos < 7'd105)
			begin
				xpos <= xpos + 1'b1;
			end
			else if (ypos < 7'd75 && xpos == 7'd105)
			begin
				ypos <= 7'd75;
			end
			else if (ypos == 7'd75 && xpos > 7'd35)
			begin
				xpos <= xpos - 1'b1;
			end
		
			x <= xpos;
			y <= ypos;
			col <= 1'b0;
		end
	endcase
	end
endmodule