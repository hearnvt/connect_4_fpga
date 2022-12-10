module connect_4(clk, rst, down, direction, out_col, out_row, player, VGA_CLK, VGA_VS, VGA_HS, VGA_BLANK_N, VGA_SYNC_N, VGA_R, VGA_G, VGA_B);
	input clk;
	input rst;
	input [1:0]direction;
	input down;
	
	output [6:0]out_col;
	output [6:0]out_row;
	output player;
	output VGA_CLK;
	output VGA_HS;
	output VGA_VS;
	output VGA_BLANK_N;
	output VGA_SYNC_N;
	output [9:0] VGA_R;
	output [9:0] VGA_G;
	output [9:0] VGA_B;

	vga_adapter VGA(
	  .resetn(1'b1),
	  .clock(clk),
	  .colour(colour),
	  .x(x),
	  .y(y),
	  .plot(1'b1),
	  .VGA_R(VGA_R),
	  .VGA_G(VGA_G),
	  .VGA_B(VGA_B),
	  .VGA_HS(VGA_HS),
	  .VGA_VS(VGA_VS),
	  .VGA_BLANK(VGA_BLANK_N),
	  .VGA_SYNC(VGA_SYNC_N),
	  .VGA_CLK(VGA_CLK));
	defparam VGA.RESOLUTION = "160x120";
	defparam VGA.MONOCHROME = "FALSE";
	defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
	defparam VGA.BACKGROUND_IMAGE = "background.mif";
	
	clock(.clock(clk), .clk(frame));
	
	wire [7:0]xpos_board;
	wire [7:0]ypos_board;
	wire [2:0]colour_board;
	
	wire [7:0]xpos_col;
	wire [7:0]ypos_col;
	wire [2:0]colour_col;
	wire clear;
	
	wire [7:0]xpos_clear;
	wire [7:0]ypos_clear;
	wire [2:0]colour_clear;
	
	
	reg [7:0]x;
	reg [7:0]y;
	reg [2:0]colour;
	wire done;
	wire frame;
	
	reg [1:0]S;
	reg [1:0]NS;
	
	parameter	START = 2'b00,
					BOARD = 2'b01,
					COLUMN = 2'b10,
					CLEAR = 2'b11;
	
	
	piece_pos position(clk, rst, ~down, ~direction, xpos_col, ypos_col, colour_col, out_col, out_row, clear, player);
	board my_board(clk, rst, xpos_board, ypos_board, colour_board, done);
	clear my_clear(clk, rst, xpos_clear, ypos_clear, colour_clear);
	
	
	integer prevx;
	integer prevy;
	
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
			NS = BOARD;
		end
		
		BOARD:
		begin
			if (done == 1'b1)
			begin
				NS = COLUMN;
			end
			else
			begin
				NS = BOARD;
			end
		end
		
		COLUMN:
		begin
			NS = CLEAR;
		end
		
		CLEAR:
		begin
			NS = COLUMN;
		end
	endcase
	end
	
	always@(posedge clk)
	begin
		case (S)
			START:
			begin
				x <= xpos_clear;
				y <= ypos_clear;
				colour <= colour_clear;
			end
			BOARD:
			begin
				x <= xpos_board;
				y <= ypos_board;
				colour <= colour_board;
			end
			COLUMN:
			begin
				x <= xpos_col;
				y <= ypos_col;
				colour <= colour_col;
			end
			CLEAR:
				if (y <= 20)
				begin
					colour <= 3'b000;
				end
		endcase
	end
	
endmodule 


module clock (input clock, output clk);
	reg [19:0] frame_counter;
	reg frame;

	always@(posedge clock)
	  begin
		 if (frame_counter == 20'b0) begin
			frame_counter = 20'd833332;  // This divisor gives us ~60 frames per second
			frame = 1'b1;
		 end 
		 
		 else 
		 begin
			frame_counter = frame_counter - 1'b1;
			frame = 1'b0;
		 end
	  end

	assign clk = frame;
endmodule