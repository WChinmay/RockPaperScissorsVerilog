module mux(
	input logic[2:0] p1, p2,
	input logic[2:0] s,
	output logic[2:0]y);
	
always_comb
	begin
		if(( (p1[2] == 0) && (p1[1] == 0) && (p1[0] == 0) ) || ( (p2[2] == 0) && (p2[1] == 0) && (p2[0] == 0)) )
			begin
				y = 3'b100;
			end
		else if( ((p1[2] == 1) && (p1[1] == 1) && (p1[0] == 1) )|| ((p2[2] == 1) && (p2[1] == 1) && (p2[0] == 1)))
			begin
				y = 3'b100;
			end
		else if( ((p1[0] == 0) && (p1[1] == 0)) ||
				 ((p1[1] == 0) && (p1[2] == 0)) ||
				 ((p1[0] == 0) && (p1[2] == 0))   )
			begin
				y = 3'b100;
			end
		else if( ((p2[0] == 0) && (p2[1] == 0)) ||
				 ((p2[1] == 0) && (p2[2] == 0)) ||
				 ((p2[0] == 0) && (p2[2] == 0))   )
			begin
				y = 3'b100;
			end
		else if( p1 == p2 )
			begin
				y = 3'b010;
			end
		else if( ((p1[0] == 0) && (p2[2] == 0)) || ((p1[1] == 0) && (p2[0] == 0)) || ((p1[2] == 0) && (p2[1] == 0)) )
			begin
				y = 3'b000;			//Player One wins
			end
		else
			begin
				y = 3'b001;			//Player Two wins
			end		
	end
endmodule
/*parameter DIG1= 3'b000;
parameter DIG2= 3'b001;
parameter DIG3= 3'b011;
parameter DIG4= 3'b100;
always_comb
	begin
		case(s)
			DIG1: y = d0;
			DIG2: y = d1;
			DIG3: y = d2;
			DIG4: y = d3;
		endcase
	end
	*/
