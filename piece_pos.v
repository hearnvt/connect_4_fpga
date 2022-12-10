module piece_pos(clk, rst, down, direction, x, y, colour, out_col, out_row, clear, player);
	input clk, rst;
	input down;
	input [1:0]direction;
	output reg [7:0]x;
	output reg [7:0]y;
	output reg [2:0]colour;
	output [6:0]out_col;
	output [6:0]out_row;
	output reg clear;
	output reg player; //1'b0 -> red, 1'b1 -> yellow
	
	parameter 	START = 6'd0,
					P_0_1 = 6'd1, P_0_2 = 6'd2, P_0_3 = 6'd3, P_0_4 = 6'd4, P_0_5 = 6'd5, P_0_6 = 6'd6, P_0_7 = 6'd7, WAIT = 6'd8,	//row 0
					P_6_1 = 6'd9, P_6_2 = 6'd10, P_6_3 = 6'd11, P_6_4 = 6'd12, P_6_5 = 6'd13, P_6_6 = 6'd14, P_6_7 = 6'd15,
					P_5_1 = 6'd16, P_5_2 = 6'd17, P_5_3 = 6'd18, P_5_4 = 6'd19, P_5_5 = 6'd20, P_5_6 = 6'd21, P_5_7 = 6'd22,
					P_4_1 = 6'd23, P_4_2 = 6'd24, P_4_3 = 6'd25, P_4_4 = 6'd26, P_4_5 = 6'd27, P_4_6 = 6'd28, P_4_7 = 6'd29,
					P_3_1 = 6'd30, P_3_2 = 6'd31, P_3_3 = 6'd32, P_3_4 = 6'd33, P_3_5 = 6'd34, P_3_6 = 6'd35, P_3_7 = 6'd36,
					P_2_1 = 6'd37, P_2_2 = 6'd38, P_2_3 = 6'd39, P_2_4 = 6'd40, P_2_5 = 6'd41, P_2_6 = 6'd42, P_2_7 = 6'd43,
					P_1_1 = 6'd44, P_1_2 = 6'd45, P_1_3 = 6'd46, P_1_4 = 6'd47, P_1_5 = 6'd48, P_1_6 = 6'd49, P_1_7 = 6'd50;
						
	reg [5:0]S;
	reg [5:0]NS;
	reg [5:0]NNS;
	
	reg [13:0]filled_6; //[13:12]: 2'b10 -> red, 2'b01 -> yellow
	reg [13:0]filled_5;
	reg [13:0]filled_4;
	reg [13:0]filled_3;
	reg [13:0]filled_2;
	reg [13:0]filled_1;
	
	
	reg [2:0]times_1;
	reg [2:0]times_2;
	reg [2:0]times_3;
	reg [2:0]times_4;
	reg [2:0]times_5;
	reg [2:0]times_6;
	reg [2:0]times_7;
	
	reg [3:0]row;
	reg [3:0]col;
	
	
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
				case (direction)
					2'b01: NS = P_0_7;
					2'b10: NS = P_0_1;
					default: NS = START;
				endcase
			end
		
			
			P_0_1:		
			begin
			case (down)
				1'b0:
				begin
					case (direction)
						2'b01: NS = WAIT;
						default: NS = P_0_1;
					endcase
				end
				1'b1:
				begin
				case (times_1)
					3'b000: NS = P_6_1;
					3'b001: NS = P_5_1;
					3'b010: NS = P_4_1;
					3'b011: NS = P_3_1;
					3'b100: NS = P_2_1;
					3'b101: NS = P_1_1;
					default: NS = P_0_1;
				endcase
				end
			endcase
			end
			
			P_0_2:		
			begin
			case (down)
				1'b0:
				begin
					case (direction)
						2'b01: NS = WAIT;
						2'b10: NS = WAIT;
						default: NS = P_0_2;
					endcase
				end
				1'b1:
				begin
					case (times_2)
					3'b000: NS = P_6_2;
					3'b001: NS = P_5_2;
					3'b010: NS = P_4_2;
					3'b011: NS = P_3_2;
					3'b100: NS = P_2_2;
					3'b101: NS = P_1_2;
					default: NS = P_0_2;
				endcase
				end
			endcase
			end
			
			P_0_3:		
			begin
			case (down)
				1'b0:
				begin
					case (direction)
						2'b01: NS = WAIT;
						2'b10: NS = WAIT;
						default: NS = P_0_3;
					endcase
				end
				1'b1:
				begin
					case (times_3)
					3'b000: NS = P_6_3;
					3'b001: NS = P_5_3;
					3'b010: NS = P_4_3;
					3'b011: NS = P_3_3;
					3'b100: NS = P_2_3;
					3'b101: NS = P_1_3;
					default: NS = P_0_3;
				endcase
				end
			endcase
			end
			
			P_0_4:		
			begin
			case (down)
				1'b0:
				begin
					case (direction)
						2'b01: NS = WAIT;
						2'b10: NS = WAIT;
						default: NS = P_0_4;
					endcase
				end
				1'b1:
				begin
					case (times_4)
					3'b000: NS = P_6_4;
					3'b001: NS = P_5_4;
					3'b010: NS = P_4_4;
					3'b011: NS = P_3_4;
					3'b100: NS = P_2_4;
					3'b101: NS = P_1_4;
					default: NS = P_0_4;
				endcase
				end
			endcase
			end
			
			P_0_5:		
			begin
			case (down)
				1'b0:
				begin
					case (direction)
						2'b01: NS = WAIT;
						2'b10: NS = WAIT;
						default: NS = P_0_5;
					endcase
				end
				1'b1:
				begin
					case (times_5)
					3'b000: NS = P_6_5;
					3'b001: NS = P_5_5;
					3'b010: NS = P_4_5;
					3'b011: NS = P_3_5;
					3'b100: NS = P_2_5;
					3'b101: NS = P_1_5;
					default: NS = P_0_5;
				endcase
				end
			endcase
			end
			
			P_0_6:		
			begin
			case (down)
				1'b0:
				begin
					case (direction)
						2'b01: NS = WAIT;
						2'b10: NS = WAIT;
						default: NS = P_0_6;
					endcase
				end
				1'b1:
				begin
					case (times_6)
					3'b000: NS = P_6_6;
					3'b001: NS = P_5_6;
					3'b010: NS = P_4_6;
					3'b011: NS = P_3_6;
					3'b100: NS = P_2_6;
					3'b101: NS = P_1_6;
					default: NS = P_0_6;
				endcase
				end
			endcase
			end
			
			P_0_7:		
			begin
			case (down)
				1'b0:
				begin
					case (direction)
						2'b10: NS = WAIT;
						default: NS = P_0_7;
					endcase
				end
				1'b1:
				begin
					case (times_7)
					3'b000: NS = P_6_7;
					3'b001: NS = P_5_7;
					3'b010: NS = P_4_7;
					3'b011: NS = P_3_7;
					3'b100: NS = P_2_7;
					3'b101: NS = P_1_7;
					default: NS = P_0_7;
				endcase
				end
			endcase
			end
			
			WAIT:
			begin
				case (direction)
					2'b00:
					begin
						case (NNS)
							P_0_1: NS = P_0_1;
							P_0_2: NS = P_0_2;
							P_0_3: NS = P_0_3;
							P_0_4: NS = P_0_4;
							P_0_5: NS = P_0_5;
							P_0_6: NS = P_0_6;
							P_0_7: NS = P_0_7;
						endcase
					end
					default: NS = WAIT;
				endcase
			end
			
			P_6_1:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_6_1;
				end
			endcase
			end
			
			P_6_2:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_6_2;
				end
			endcase
			end
			
			P_6_3:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_6_3;
				end
			endcase
			end
			
			P_6_4:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_6_4;
				end
			endcase
			end
			
			P_6_5:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_6_5;
				end
			endcase
			end
			
			P_6_6:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_6_6;
				end
			endcase
			end
			
			P_6_7:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_6_7;
				end
			endcase
			end
			
			P_5_1:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_5_1;
				end
			endcase
			end
			
			P_5_2:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_5_2;
				end
			endcase
			end
			
			P_5_3:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_5_3;
				end
			endcase
			end
			
			P_5_4:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_5_4;
				end
			endcase
			end
			
			P_5_5:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_5_5;
				end
			endcase
			end
			
			P_5_6:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_5_6;
				end
			endcase
			end
			
			P_5_7:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_5_7;
				end
			endcase
			end
			
			P_4_1:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_4_1;
				end
			endcase
			end
			
			P_4_2:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_4_2;
				end
			endcase
			end
			
			P_4_3:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_4_3;
				end
			endcase
			end
			
			P_4_4:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_4_4;
				end
			endcase
			end
			
			P_4_5:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_4_5;
				end
			endcase
			end
			
			P_4_6:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_4_6;
				end
			endcase
			end
			
			P_4_7:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_4_7;
				end
			endcase
			end
			
			P_3_1:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_3_1;
				end
			endcase
			end
			
			P_3_2:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_3_2;
				end
			endcase
			end
			
			P_3_3:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_3_3;
				end
			endcase
			end
			
			P_3_4:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_3_4;
				end
			endcase
			end
			
			P_3_5:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_3_5;
				end
			endcase
			end
			
			P_3_6:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_3_6;
				end
			endcase
			end
			
			P_3_7:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_3_7;
				end
			endcase
			end
			
			P_2_1:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_2_1;
				end
			endcase
			end
			
			P_2_2:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_2_2;
				end
			endcase
			end
			
			P_2_3:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_2_3;
				end
			endcase
			end
			
			P_2_4:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_2_4;
				end
			endcase
			end
			
			P_2_5:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_2_5;
				end
			endcase
			end
			
			P_2_6:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_2_6;
				end
			endcase
			end
			
			P_2_7:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_2_7;
				end
			endcase
			end
			
			P_1_1:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_1_1;
				end
			endcase
			end
			
			P_1_2:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_1_2;
				end
			endcase
			end
			
			P_1_3:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_1_3;
				end
			endcase
			end
			
			P_1_4:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_1_4;
				end
			endcase
			end
			
			P_1_5:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_1_5;
				end
			endcase
			end
			
			P_1_6:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_1_6;
				end
			endcase
			end
			
			P_1_7:
			begin
			case (down)
				1'b0: 
				begin
					NS = START;
				end
				default:
				begin
					NS = P_1_7;
				end
			endcase
			end
		endcase
	end
	
	always@(posedge clk)
	begin
		case (player) 
			1'b0: colour <= 3'b100;
			default: colour <= 3'b110;
		endcase
		case (S)
			START:
			begin
				clear <= 1'b1;
				x <= 8'd70;
				y <= 8'd10;
				
				if (rst == 1'b0)
				begin
					times_1 <= 3'b000;
					times_2 <= 3'b000;
					times_3 <= 3'b000;
					times_4 <= 3'b000;
					times_5 <= 3'b000;
					times_6 <= 3'b000;
					times_7 <= 3'b000;
					player <= 1'b1;
				end
				col <= 4'b0000;
				row <= 4'b0000;
			end
			
			P_0_1:
			begin
				case (direction)
					2'b01: NNS <= P_0_2;
					default: NNS <= P_0_1;
				endcase
				clear <= 1'b1;
				x <= 8'd40;
				y <= 8'd20;
				col <= 4'b0001;
			end
			
			P_0_2:
			begin
				case (direction)
					2'b01: NNS <= P_0_3;
					2'b10: NNS <= P_0_1;
					default: NNS <= P_0_2;
				endcase
				clear <= 1'b1;
				x <= 8'd50;
				y <= 8'd20;
				col <= 4'b0010;
			end
			
			P_0_3:
			begin
				case (direction)
					2'b01: NNS <= P_0_4;
					2'b10: NNS <= P_0_2;
					default: NNS <= P_0_3;
				endcase
				clear <= 1'b1;
				x <= 8'd60;
				y <= 8'd20;
				col <= 4'b0011;
			end
			
			P_0_4:
			begin
				case (direction)
					2'b01: NNS <= P_0_5;
					2'b10: NNS <= P_0_3;
					default: NNS <= P_0_4;
				endcase
				clear <= 1'b1;
				x <= 8'd70;
				y <= 8'd20;
				col <= 4'b0100;
			end
			
			P_0_5:
			begin
				case (direction)
					2'b01: NNS <= P_0_6;
					2'b10: NNS <= P_0_4;
					default: NNS <= P_0_5;
				endcase
				clear <= 1'b1;
				x <= 8'd80;
				y <= 8'd20;
				col <= 4'b0101;
			end
			
			P_0_6:
			begin
				case (direction)
					2'b01: NNS <= P_0_7;
					2'b10: NNS <= P_0_5;
					default: NNS <= P_0_6;
				endcase
				clear <= 1'b1;
				x <= 8'd90;
				y <= 8'd20;
				col <= 4'b0110;
			end
			
			P_0_7:
			begin
				case (direction)
					2'b10: NNS <= P_0_6;
					default: NNS <= P_0_7;
				endcase
				clear <= 1'b1;
				x <= 8'd100;
				y <= 8'd20;
				col <= 4'b0111;
			end
			
			WAIT:
			begin
				row <= 4'b1000;
				col <= 4'b1000;
			end
			
			P_6_1:
			begin
					clear <= 1'b0;
					row <= 4'b0110;
					y <= 80;
					if (filled_6[13:12] == 2'b00)
					begin
					case (player)
						1'b0: filled_6[13:12] <= 2'b10;
						default: filled_6[13:12] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						if (player == 1'b0)
						player <= 1'b1;
						else
						player <= 1'b0;
						times_1 <= 3'b001;
					end
					endcase
			end
			
			P_6_2:
			begin
					clear <= 1'b0;
					row <= 4'b0110;
					y <= 80;
					if (filled_6[11:10] == 2'b00)
					begin
					case (player)
						1'b0: filled_6[11:10] <= 2'b10;
						default: filled_6[11:10] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_2 <= 3'b001;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_6_3:
			begin
					clear <= 1'b0;
					row <= 4'b0110;
					y <= 80;
					if (filled_6[9:8] == 2'b00)
					begin
					case (player)
						1'b0: filled_6[9:8] <= 2'b10;
						default: filled_6[9:8] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_3 <= 3'b001;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_6_4:
			begin
					clear <= 1'b0;
					row <= 4'b0110;
					y <= 80;
					if (filled_6[7:6] == 2'b00)
					begin
					case (player)
						1'b0: filled_6[7:6] <= 2'b10;
						default: filled_6[7:6] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_4 <= 3'b001;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_6_5:
			begin
					clear <= 1'b0;
					row <= 4'b0110;
					y <= 80;
					if (filled_6[5:4] == 2'b00)
					begin
					case (player)
						1'b0: filled_6[5:4] <= 2'b10;
						default: filled_6[5:4] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_5 <= 3'b001;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_6_6:
			begin
					clear <= 1'b0;
					row <= 4'b0110;
					y <= 80;
					if (filled_6[3:2] == 2'b00)
					begin
					case (player)
						1'b0: filled_6[3:2] <= 2'b10;
						default: filled_6[3:2] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_6 <= 3'b001;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_6_7:
			begin
					clear <= 1'b0;
					row <= 4'b0110;
					y <= 80;
					if (filled_6[1:0] == 2'b00)
					begin
					case (player)
						1'b0: filled_6[1:0] <= 2'b10;
						default: filled_6[1:0] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_7 <= 3'b001;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_5_1:
			begin
					clear <= 1'b0;
					row <= 4'b0101;
					y <= 70;
					if (filled_5[13:12] == 2'b00)
					begin
					case (player)
						1'b0: filled_5[13:12] <= 2'b10;
						default: filled_5[13:12] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_1 <= 3'b010;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_5_2:
			begin
					clear <= 1'b0;
					row <= 4'b0101;
					y <= 70;
					if (filled_5[11:10] == 2'b00)
					begin
					case (player)
						1'b0: filled_5[11:10] <= 2'b10;
						default: filled_5[11:10] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_2 <= 3'b010;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_5_3:
			begin
					clear <= 1'b0;
					row <= 4'b0101;
					y <= 70;
					if (filled_5[9:8] == 2'b00)
					begin
					case (player)
						1'b0: filled_5[9:8] <= 2'b10;
						default: filled_5[9:8] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_3 <= 3'b010;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_5_4:
			begin
					clear <= 1'b0;
					row <= 4'b0101;
					y <= 70;
					if (filled_5[7:6] == 2'b00)
					begin
					case (player)
						1'b0: filled_5[7:6] <= 2'b10;
						default: filled_5[7:6] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_4 <= 3'b010;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_5_5:
			begin
					clear <= 1'b0;
					row <= 4'b0101;
					y <= 70;
					if (filled_5[5:4] == 2'b00)
					begin
					case (player)
						1'b0: filled_5[5:4] <= 2'b10;
						default: filled_5[5:4] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_5 <= 3'b010;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_5_6:
			begin
					clear <= 1'b0;
					row <= 4'b0101;
					y <= 70;
					if (filled_5[3:2] == 2'b00)
					begin
					case (player)
						1'b0: filled_5[3:2] <= 2'b10;
						default: filled_5[3:2] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_6 <= 3'b010;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_5_7:
			begin
					clear <= 1'b0;
					row <= 4'b0101;
					y <= 70;
					if (filled_5[1:0] == 2'b00)
					begin
					case (player)
						1'b0: filled_5[1:0] <= 2'b10;
						default: filled_5[1:0] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_7 <= 3'b010;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_4_1:
			begin
					clear <= 1'b0;
					row <= 4'b0100;
					y <= 60;
					if (filled_4[13:12] == 2'b00)
					begin
					case (player)
						1'b0: filled_4[13:12] <= 2'b10;
						default: filled_4[13:12] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_1 <= 3'b011;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_4_2:
			begin
					clear <= 1'b0;
					row <= 4'b0100;
					y <= 60;
					if (filled_4[11:10] == 2'b00)
					begin
					case (player)
						1'b0: filled_4[11:10] <= 2'b10;
						default: filled_4[11:10] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_2 <= 3'b011;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_4_3:
			begin
					clear <= 1'b0;
					row <= 4'b0100;
					y <= 60;
					if (filled_4[9:8] == 2'b00)
					begin
					case (player)
						1'b0: filled_4[9:8] <= 2'b10;
						default: filled_4[9:8] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_3 <= 3'b011;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_4_4:
			begin
					clear <= 1'b0;
					row <= 4'b0100;
					y <= 60;
					if (filled_4[7:6] == 2'b00)
					begin
					case (player)
						1'b0: filled_4[7:6] <= 2'b10;
						default: filled_4[7:6] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_4 <= 3'b011;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_4_5:
			begin
					clear <= 1'b0;
					row <= 4'b0100;
					y <= 60;
					if (filled_4[5:4] == 2'b00)
					begin
					case (player)
						1'b0: filled_4[5:4] <= 2'b10;
						default: filled_4[5:4] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_5 <= 3'b011;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_4_6:
			begin
					clear <= 1'b0;
					row <= 4'b0100;
					y <= 60;
					if (filled_4[3:2] == 2'b00)
					begin
					case (player)
						1'b0: filled_4[3:2] <= 2'b10;
						default: filled_4[3:2] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_6 <= 3'b011;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_4_7:
			begin
					clear <= 1'b0;
					row <= 4'b0100;
					y <= 60;
					if (filled_4[1:0] == 2'b00)
					begin
					case (player)
						1'b0: filled_4[1:0] <= 2'b10;
						default: filled_4[1:0] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_7 <= 3'b011;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_3_1:
			begin
					clear <= 1'b0;
					row <= 4'b0011;
					y <= 50;
					if (filled_3[13:12] == 2'b00)
					begin
					case (player)
						1'b0: filled_3[13:12] <= 2'b10;
						default: filled_3[13:12] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_1 <= 3'b100;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_3_2:
			begin
					clear <= 1'b0;
					row <= 4'b0011;
					y <= 50;
					if (filled_3[11:10] == 2'b00)
					begin
					case (player)
						1'b0: filled_3[11:10] <= 2'b10;
						default: filled_3[11:10] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_2 <= 3'b100;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_3_3:
			begin
					clear <= 1'b0;
					row <= 4'b0011;
					y <= 50;
					if (filled_3[9:8] == 2'b00)
					begin
					case (player)
						1'b0: filled_3[9:8] <= 2'b10;
						default: filled_3[9:8] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_3 <= 3'b100;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_3_4:
			begin
					clear <= 1'b0;
					row <= 4'b0011;
					y <= 50;
					if (filled_3[7:6] == 2'b00)
					begin
					case (player)
						1'b0: filled_3[7:6] <= 2'b10;
						default: filled_3[7:6] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_4 <= 3'b100;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_3_5:
			begin
					clear <= 1'b0;
					row <= 4'b0011;
					y <= 50;
					if (filled_3[5:4] == 2'b00)
					begin
					case (player)
						1'b0: filled_3[5:4] <= 2'b10;
						default: filled_3[5:4] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_5 <= 3'b100;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_3_6:
			begin
					clear <= 1'b0;
					row <= 4'b0011;
					y <= 50;
					if (filled_3[3:2] == 2'b00)
					begin
					case (player)
						1'b0: filled_3[3:2] <= 2'b10;
						default: filled_3[3:2] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_6 <= 3'b100;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_3_7:
			begin
					clear <= 1'b0;
					row <= 4'b0011;
					y <= 50;
					if (filled_3[1:0] == 2'b00)
					begin
					case (player)
						1'b0: filled_3[1:0] <= 2'b10;
						default: filled_3[1:0] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_7 <= 3'b100;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_2_1:
			begin
					clear <= 1'b0;
					row <= 4'b0010;
					y <= 40;
					if (filled_2[13:12] == 2'b00)
					begin
					case (player)
						1'b0: filled_2[13:12] <= 2'b10;
						default: filled_2[13:12] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_1 <= 3'b101;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_2_2:
			begin
					clear <= 1'b0;
					row <= 4'b0010;
					y <= 40;
					if (filled_2[11:10] == 2'b00)
					begin
					case (player)
						1'b0: filled_2[11:10] <= 2'b10;
						default: filled_2[11:10] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_2 <= 3'b101;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_2_3:
			begin
					clear <= 1'b0;
					row <= 4'b0010;
					y <= 40;
					if (filled_2[9:8] == 2'b00)
					begin
					case (player)
						1'b0: filled_2[9:8] <= 2'b10;
						default: filled_2[9:8] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_3 <= 3'b101;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_2_4:
			begin
					clear <= 1'b0;
					row <= 4'b0010;
					y <= 40;
					if (filled_2[7:6] == 2'b00)
					begin
					case (player)
						1'b0: filled_2[7:6] <= 2'b10;
						default: filled_2[7:6] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_4 <= 3'b101;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_2_5:
			begin
					clear <= 1'b0;
					row <= 4'b0010;
					y <= 40;
					if (filled_2[5:4] == 2'b00)
					begin
					case (player)
						1'b0: filled_2[5:4] <= 2'b10;
						default: filled_2[5:4] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_5 <= 3'b101;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_2_6:
			begin
					clear <= 1'b0;
					row <= 4'b0010;
					y <= 40;
					if (filled_2[3:2] == 2'b00)
					begin
					case (player)
						1'b0: filled_2[3:2] <= 2'b10;
						default: filled_2[3:2] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_6 <= 3'b101;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_2_7:
			begin
					clear <= 1'b0;
					row <= 4'b0010;
					y <= 40;
					if (filled_2[1:0] == 2'b00)
					begin
					case (player)
						1'b0: filled_2[1:0] <= 2'b10;
						default: filled_2[1:0] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_7 <= 3'b101;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_1_1:
			begin
					clear <= 1'b0;
					row <= 4'b0001;
					y <= 30;
					if (filled_1[13:12] == 2'b00)
					begin
					case (player)
						1'b0: filled_1[13:12] <= 2'b10;
						default: filled_1[13:12] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_1 <= 3'b110;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_1_2:
			begin
					clear <= 1'b0;
					row <= 4'b0001;
					y <= 30;
					if (filled_1[11:10] == 2'b00)
					begin
					case (player)
						1'b0: filled_1[11:10] <= 2'b10;
						default: filled_1[11:10] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_2 <= 3'b110;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_1_3:
			begin
					clear <= 1'b0;
					row <= 4'b0001;
					y <= 30;
					if (filled_1[9:8] == 2'b00)
					begin
					case (player)
						1'b0: filled_1[9:8] <= 2'b10;
						default: filled_1[9:8] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_3 <= 3'b110;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_1_4:
			begin
					clear <= 1'b0;
					row <= 4'b0001;
					y <= 30;
					if (filled_1[7:6] == 2'b00)
					begin
					case (player)
						1'b0: filled_1[7:6] <= 2'b10;
						default: filled_1[7:6] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_4 <= 3'b110;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_1_5:
			begin
					clear <= 1'b0;
					row <= 4'b0001;
					y <= 30;
					if (filled_1[5:4] == 2'b00)
					begin
					case (player)
						1'b0: filled_1[5:4] <= 2'b10;
						default: filled_1[5:4] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_5 <= 3'b110;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_1_6:
			begin
					clear <= 1'b0;
					row <= 4'b0001;
					y <= 30;
					if (filled_1[3:2] == 2'b00)
					begin
					case (player)
						1'b0: filled_1[3:2] <= 2'b10;
						default: filled_1[3:2] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_6 <= 3'b110;
						player <= player + 1'b1;
					end
					endcase
			end
			
			P_1_7:
			begin
					clear <= 1'b0;
					row <= 4'b0001;
					y <= 30;
					if (filled_1[1:0] == 2'b00)
					begin
					case (player)
						1'b0: filled_1[1:0] <= 2'b10;
						default: filled_1[1:0] <= 2'b01;
					endcase
					end
					case (down)
					1'b0:
					begin
						times_7 <= 3'b110;
						player <= player + 1'b1;
					end
					endcase
			end
		endcase
	end
	
	seven_segment sevseg_col(col, out_col);
	seven_segment sevseg_row(row, out_row);
	
	endmodule