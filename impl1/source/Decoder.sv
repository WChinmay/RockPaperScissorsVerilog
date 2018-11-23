module dec(input logic[2:0] data,
		   output logic [6:0] segments);
	always_comb
	case(data)
		3'b100:		segments = 7'b111_1110;
		3'b010:		segments = 7'b100_0010;
		3'b000:		segments = 7'b100_1111;
		3'b001:		segments = 7'b001_0010;
		default:    segments = 7'b111_1111;
	endcase
endmodule
		
	
	
	
	
	
	
	/*always_comb
	case(data)
		//				abc_defg
		0:		segments=7'b000_0001;
		1:		segments=7'b100_1111;
		2:		segments=7'b001_0010;
		3:		segments=7'b000_0110;
		4:		segments=7'b100_1100;
		5:		segments=7'b010_0100;
		6:		segments=7'b010_0000;
		7:		segments=7'b000_1111;
		8:		segments=7'b000_0000;
		9:		segments=7'b000_1100;
		default:segments=7'b111_1111;
	endcase
endmodule
*/
