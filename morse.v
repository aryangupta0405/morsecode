module minor_project(clk,A,B,C,D,buz);
input clk;
input  A;
input  B;
input  C;
input  D;
output buz;

wire buzA,buzB,buzC,buzD;
wire clkA,clkB,clkC,clkD;

assign clkA = clk;
assign clkB = clk;
assign clkC = clk;
assign clkD = clk;

morse_A u1(.clk(clkA),.buzA(buzA),.A(A));
morse_B u2(.clk(clk),.buzB(buzB),.B(B));
morse_C u3(.clk(clk),.buzC(buzC),.C(C));
morse_D u4(.clk(clk),.buzD(buzD),.D(D));

assign buz =buzA | buzB | buzC | buzD ;


endmodule



module morse_A (clk,buzA,A);

   input clk;
	input A;
	output reg buzA;
	
	parameter DOT_DURATION = 3; // Duration of a dot in clock cycles
	parameter DASH_DURATION = 3 * DOT_DURATION; // Duration of a dash in clock cycles
	parameter LETTER_DURATION =  DOT_DURATION; // Duration of space between words in clock cycles


	reg [31:0] counter = 0;
	reg  [2:0]state = 0;

	always @(posedge clk) begin
	if (A==0) begin
		if (state == 0) begin // Dot
			  if (counter < DOT_DURATION) begin
					buzA = 1;
			  end 
			  else begin
					buzA = 0;
					counter = 0;
					state = 1;
			  end
		 end 
		 
		else if (state == 1) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzA = 0;
			  end 
			  else begin
					buzA = 0;
					counter = 0;
					state = 2;
					
			  end
		 end
			  
		else if (state == 2) begin // Dash
			  if (counter < DASH_DURATION) begin
					buzA = 1;
			  end 
				
			  else begin
					buzA = 0;
					counter = 0;
					state =3;
			  end
			  

		 end
		 
		 else if (state == 3) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzA = 0;
			  end 
			  else begin
					buzA = 0;
					counter = 0;
					state = 3;
					
			  end
		 end
		 counter = counter + 1;
	end
	else begin
		buzA = 0;
		counter = 0;
		state =0;
	end
	end
	
endmodule

module morse_B (clk,buzB,B);

   input clk;
	input B;
	output reg buzB;
	parameter DOT_DURATION = 3; // Duration of a dot in clock cycles
	parameter DASH_DURATION = 3 * DOT_DURATION; // Duration of a dash in clock cycles
	parameter LETTER_DURATION =  DOT_DURATION; // Duration of space between words in clock cycles

	reg [31:0] counter = 0;
	reg  [3:0]state = 0;

	always @(posedge clk) begin
	if (B==0) begin
		if (state == 0) begin // Dot
			  if (counter < DASH_DURATION) begin
					buzB = 1;
			  end 
			  else begin
					buzB = 0;
					counter = 0;
					state = 1;
			  end
		 end 
		 
		else if (state == 1) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzB = 0;
			  end 
			  else begin
					buzB = 0;
					counter = 0;
					state = 2;
					
			  end
		 end
		 else if (state == 2) begin // Dot
			  if (counter < DOT_DURATION) begin
					buzB = 1;
			  end 
			  else begin
					buzB = 0;
					counter = 0;
					state = 3;
			  end
		 end 
		 
		else if (state == 3) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzB = 0;
			  end 
			  else begin
					buzB = 0;
					counter = 0;
					state = 4;
					
			  end
		 end
			  
		else if (state == 4) begin // Dash
			  if (counter < DOT_DURATION) begin
					buzB = 1;
			  end 
				
			  else begin
					buzB = 0;
					counter = 0;
					state =5;
			  end

		 end
		 
		 else if (state == 5) begin // Dot
			  if (counter < LETTER_DURATION) begin
					buzB = 0;
			  end 
			  else begin
					buzB = 0;
					counter = 0;
					state = 6;
			  end
		 end 
		 
		else if (state == 6) begin // Dash
			  if (counter < DOT_DURATION) begin
					buzB = 1;
			  end 
			  else begin
					buzB = 0;
					counter = 0;
					state = 7;
					
			  end
		 end
		
		 
		 else if (state == 7) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzB = 0;
			  end 
			  else begin
					buzB = 0;
					counter = 0;
					state = 7;
					
			  end
		end	  
		 counter = counter + 1;
	end
	else begin
		buzB = 0;
		counter = 0;
		state =0;
	end
	end
	
endmodule

module morse_C (clk,buzC,C);

   input clk;
	input C;
	output reg buzC;
	parameter DOT_DURATION = 3; // Duration of a dot in clock cycles
	parameter DASH_DURATION = 3 * DOT_DURATION; // Duration of a dash in clock cycles
	parameter SPACE_DURATION = 7 * DOT_DURATION; // Duration of space between letters in clock cycles
	parameter LETTER_DURATION =  DOT_DURATION; // Duration of space between words in clock cycles

	reg [31:0] counter = 0;
reg  [3:0]state = 0;

	always @(posedge clk) begin
	if (C==0) begin
		if (state == 0) begin // Dot
			  if (counter < DASH_DURATION) begin
					buzC = 1;
			  end 
			  else begin
					buzC = 0;
					counter = 0;
					state = 1;
			  end
		 end 
		 
		else if (state == 1) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzC = 0;
			  end 
			  else begin
					buzC = 0;
					counter = 0;
					state = 2;
					
			  end
		 end
		 else if (state == 2) begin // Dot
			  if (counter < DOT_DURATION) begin
					buzC = 1;
			  end 
			  else begin
					buzC = 0;
					counter = 0;
					state = 3;
			  end
		 end 
		 
		else if (state == 3) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzC = 0;
			  end 
			  else begin
					buzC = 0;
					counter = 0;
					state = 4;
					
			  end
		 end
			  
		else if (state == 4) begin // Dash
			  if (counter < DASH_DURATION) begin
					buzC = 1;
			  end 
				
			  else begin
					buzC = 0;
					counter = 0;
					state =5;
			  end

		 end
		 
		 else if (state == 5) begin // Dot
			  if (counter < LETTER_DURATION) begin
					buzC = 0;
			  end 
			  else begin
					buzC = 0;
					counter = 0;
					state = 6;
			  end
		 end 
		 
		else if (state == 6) begin // Dash
			  if (counter < DOT_DURATION) begin
					buzC = 1;
			  end 
			  else begin
					buzC = 0;
					counter = 0;
					state = 7;
					
			  end
		 end
		
		 
		 else if (state == 7) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzC = 0;
			  end 
			  else begin
					buzC = 0;
					counter = 0;
					state = 7;
					
			  end
		end	  
		 counter = counter + 1;
	end
	else begin
		buzC = 0;
		counter = 0;
		state =0;
	end
	end
	
endmodule

module morse_D (clk,buzD,D);

   input clk;
	input D;
	output reg buzD;
	parameter DOT_DURATION = 3; // Duration of a dot in clock cycles
	parameter DASH_DURATION = 3 * DOT_DURATION; // Duration of a dash in clock cycles
	parameter SPACE_DURATION = 7 * DOT_DURATION; // Duration of space between letters in clock cycles
	parameter LETTER_DURATION =  DOT_DURATION; // Duration of space between words in clock cycles

	reg [31:0] counter = 0;
	reg  [3:0]state = 0;

	always @(posedge clk) begin
	if (D==0) begin
		if (state == 0) begin // Dot
			  if (counter < DASH_DURATION) begin
					buzD = 1;
			  end 
			  else begin
					buzD = 0;
					counter = 0;
					state = 1;
			  end
		 end 
		 
		else if (state == 1) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzD = 0;
			  end 
			  else begin
					buzD = 0;
					counter = 0;
					state = 2;
					
			  end
		 end
			  
		else if (state == 2) begin // Dash
			  if (counter < DOT_DURATION) begin
					buzD = 1;
			  end 
				
			  else begin
					buzD = 0;
					counter = 0;
					state =3;
			  end
		end	  
		else if (state == 3) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzD = 0;
			  end 
			  else begin
					buzD = 0;
					counter = 0;
					state = 4;
					
			  end
		end	  
		else if (state == 4) begin // Dash
			  if (counter < DOT_DURATION) begin
					buzD = 1;
			  end 
				
			  else begin
					buzD = 0;
					counter = 0;
					state =5;
			  end
		end	  
		else if (state == 5) begin // Dash
			  if (counter < LETTER_DURATION) begin
					buzD = 0;
			  end 
			  else begin
					buzD = 0;
					counter = 0;
					state = 5;
					
			  end
			    
		 end
		 
		 counter = counter + 1;
	end
	else begin
		buzD = 0;
		counter = 0;
		state =0;
	end

end
	
endmodule


