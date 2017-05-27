`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:53 12/21/2015 
// Design Name: 
// Module Name:    GameController 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GameController(CLK, red, blue, led, en, p1Score, turn, turnswitch, reset);

output turn;
input turnswitch;
reg p1win = 0;
reg p2win = 0;
input reset;


assign turn = turnswitch;

input CLK;
input [5:0] led;

output reg [63:0] red = 64'b0000000000000000000000000000000000000000000000000000000000000000;
output reg [63:0] blue = 64'b0000000000000000000000000000000000000000000000000000000000000000;

output reg  p1Score;

reg[7:0] i, j, k, m, a, b, r, t;

input en;

initial begin
red[63:0] = 0;
blue[63:0] = 0;
p1Score=4'b0000;
end


// incrementing the score if someone made a connection, reseting game if someone's score reached 3
always@(p1win, p2win)
begin
	if (p1win)
	begin
		p1Score=4'b0001;
	end
	
	if (p2win)
	begin
		p1Score=4'b0010;
	end
end
//inserting bubbles
always @ (en)
begin
	if(reset)
	begin
	red = 64'b0000000000000000000000000000000000000000000000000000000000000000;
	blue = 64'b0000000000000000000000000000000000000000000000000000000000000000;
	//p1Score = 4'b0000;
	end
	
	if(en)
	begin
		if (turn==1) 
		begin	
			case(led)
			0: if ( red[0]==0 && blue[0]==0)begin blue[0]=1;     end 
			1: if ( red[1]==0 && blue[1]==0)begin  blue[1]=1;     end 
			2: if ( red[2]==0 && blue[2]==0)begin blue[2]=1;     end 
			3: if ( red[3]==0 && blue[3]==0)begin  blue[3]=1;     end
			4: if ( red[4]==0 && blue[4]==0)begin blue[4]=1;   end
			5: if (  red[5]==0 && blue[5]==0)begin blue[5]=1;     end
			6: if (  red[6]==0 && blue[6]==0)begin  blue[6]=1;    end
			7: if (  red[7]==0 && blue[7]==0)begin blue[7]=1;  end
			8: if (  red[8]==0 && blue[8]==0)begin blue[8]=1;   end
			9: if (  red[9]==0 && blue[9]==0)begin blue[9]=1;   end
			10: if (  red[10]==0 && blue[10]==0)begin blue[10]=1;   end
			11: if (  red[11]==0 && blue[11]==0)begin blue[11]=1;   end
			12: if (  red[12]==0 && blue[12]==0)begin blue[12]=1;   end
			13: if (  red[13]==0 && blue[13]==0)begin blue[13]=1;   end
			14: if (  red[14]==0 && blue[14]==0)begin blue[14]=1;   end
			15: if (  red[15]==0 && blue[15]==0)begin blue[15]=1;   end
			16: if (  red[16]==0 && blue[16]==0)begin blue[16]=1;   end
			17: if (  red[17]==0 && blue[17]==0)begin blue[17]=1;     end
			18: if (  red[18]==0 && blue[18]==0)begin blue[18]=1;     end
			19: if (  red[19]==0 && blue[19]==0)begin blue[19]=1;    end
			20: if (  red[20]==0 && blue[20]==0)begin blue[20]=1;    end
			21: if (  red[21]==0 && blue[21]==0)begin blue[21]=1;    end
			22: if (  red[22]==0 && blue[22]==0)begin blue[22]=1;    end
			23: if (  red[23]==0 && blue[23]==0)begin blue[23]=1;    end
			24: if (  red[24]==0 && blue[24]==0)begin blue[24]=1;    end
			25: if (  red[25]==0 && blue[25]==0)begin blue[25]=1;    end
			26: if (  red[26]==0 && blue[26]==0)begin blue[26]=1;    end
			27: if (  red[27]==0 && blue[27]==0)begin blue[27]=1;    end
			28: if (  red[28]==0 && blue[28]==0)begin blue[28]=1;    end
			29: if (  red[29]==0 && blue[29]==0)begin blue[29]=1;    end
			30: if (  red[30]==0 && blue[30]==0)begin blue[30]=1;    end
			31: if (  red[31]==0 && blue[31]==0)begin blue[31]=1;    end
			32: if (  red[32]==0 && blue[32]==0)begin blue[32]=1;    end
			33: if (  red[33]==0 && blue[33]==0)begin blue[33]=1;    end
			34: if (  red[34]==0 && blue[34]==0)begin blue[34]=1;    end
			35: if (  red[35]==0 && blue[35]==0)begin blue[35]=1;   end
			36: if (  red[36]==0 && blue[36]==0)begin blue[36]=1;   end
			37: if (  red[37]==0 && blue[37]==0)begin blue[37]=1;   end
			38: if (  red[38]==0 && blue[38]==0)begin blue[38]=1;   end
			39: if (  red[39]==0 && blue[39]==0)begin blue[39]=1;   end
			40: if (  red[40]==0 && blue[40]==0)begin blue[40]=1;   end
			41: if (  red[41]==0 && blue[41]==0)begin blue[41]=1;   end
			42: if (  red[42]==0 && blue[42]==0)begin blue[42]=1;   end
			43: if (  red[43]==0 && blue[43]==0)begin blue[43]=1;   end
			44: if (  red[44]==0 && blue[44]==0)begin blue[44]=1;   end
			45: if (  red[45]==0 && blue[45]==0)begin blue[45]=1;   end
			46: if (  red[46]==0 && blue[46]==0)begin blue[46]=1;   end
			47: if (  red[47]==0 && blue[47]==0)begin blue[47]=1;   end
			48: if (  red[48]==0 && blue[48]==0)begin blue[48]=1;   end
			49: if (  red[49]==0 && blue[49]==0)begin blue[49]=1;   end
			50: if (  red[50]==0 && blue[50]==0)begin blue[50]=1;   end
			51: if (  red[51]==0 && blue[51]==0)begin blue[51]=1;   end
			52: if (  red[52]==0 && blue[52]==0)begin blue[52]=1;   end
			53: if (  red[53]==0 && blue[53]==0)begin blue[53]=1;   end
			54: if (  red[54]==0 && blue[54]==0)begin blue[54]=1;   end
			55: if (  red[55]==0 && blue[55]==0)begin blue[55]=1;   end
			56: if (  red[56]==0 && blue[56]==0)begin blue[56]=1;   end
			57: if (  red[57]==0 && blue[57]==0)begin blue[57]=1;   end
			58: if (  red[58]==0 && blue[58]==0)begin blue[58]=1;   end
			59: if (  red[59]==0 && blue[59]==0)begin blue[59]=1;   end
			60: if (  red[60]==0 && blue[60]==0)begin blue[60]=1;   end
			61: if (  red[61]==0 && blue[61]==0)begin blue[61]=1;   end
			62: if (  red[62]==0 && blue[62]==0)begin blue[62]=1;   end
			63: if (  red[63]==0 && blue[63]==0)begin blue[63]=1;   end
			endcase			
		end
	
		else 
		begin
			case(led)
			0: if ( red[0]==0 && blue[0]==0)begin red[0]=1; end
			1: if ( red[1]==0 && blue[1]==0)begin  red[1]=1; end
			2: if ( red[2]==0 && blue[2]==0)begin red[2]=1;   end
			3: if ( red[3]==0 && blue[3]==0)begin red[3]=1;   end
			4: if ( red[4]==0 && blue[4]==0)begin red[4]=1;   end
			5: if (  red[5]==0 && blue[5]==0)begin red[5]=1;   end
			6: if (  red[6]==0 && blue[6]==0)begin red[6]=1;   end
			7: if (  red[7]==0 && blue[7]==0)begin red[7]=1; end
			8: if (  red[8]==0 && blue[8]==0)begin red[8]=1;  end
			9: if (  red[9]==0 && blue[9]==0)begin red[9]=1;  end
			10: if (  red[10]==0 && blue[10]==0)begin red[10]=1;  end
			11: if (  red[11]==0 && blue[11]==0)begin red[11]=1;  end
			12: if (  red[12]==0 && blue[12]==0)begin red[12]=1;  end
			13: if (  red[13]==0 && blue[13]==0)begin red[13]=1;  end
			14: if (  red[14]==0 && blue[14]==0)begin red[14]=1;  end
			15: if (  red[15]==0 && blue[15]==0)begin red[15]=1;  end
			16: if (  red[16]==0 && blue[16]==0)begin red[16]=1;  end
			17: if (  red[17]==0 && blue[17]==0)begin red[17]=1;     end
			18: if (  red[18]==0 && blue[18]==0)begin red[18]=1;     end
			19: if (  red[19]==0 && blue[19]==0)begin red[19]=1;   end
			20: if (  red[20]==0 && blue[20]==0)begin red[20]=1;   end
			21: if (  red[21]==0 && blue[21]==0)begin red[21]=1;   end
			22: if (  red[22]==0 && blue[22]==0)begin red[22]=1;   end
			23: if (  red[23]==0 && blue[23]==0)begin red[23]=1;   end
			24: if (  red[24]==0 && blue[24]==0)begin red[24]=1;   end
			25: if (  red[25]==0 && blue[25]==0)begin red[25]=1;   end
			26: if (  red[26]==0 && blue[26]==0)begin red[26]=1;   end
			27: if (  red[27]==0 && blue[27]==0)begin red[27]=1;   end
			28: if (  red[28]==0 && blue[28]==0)begin red[28]=1;   end
			29: if (  red[29]==0 && blue[29]==0)begin red[29]=1;   end
			30: if (  red[30]==0 && blue[30]==0)begin red[30]=1;   end
			31: if (  red[31]==0 && blue[31]==0)begin red[31]=1;   end
			32: if (  red[32]==0 && blue[32]==0)begin red[32]=1;   end
			33: if (  red[33]==0 && blue[33]==0)begin red[33]=1;   end
			34: if (  red[34]==0 && blue[34]==0)begin red[34]=1;   end
			35: if (  red[35]==0 && blue[35]==0)begin red[35]=1;  end
			36: if (  red[36]==0 && blue[36]==0)begin red[36]=1;  end
			37: if (  red[37]==0 && blue[37]==0)begin red[37]=1;  end
			38: if (  red[38]==0 && blue[38]==0)begin red[38]=1;  end
			39: if (  red[39]==0 && blue[39]==0)begin red[39]=1;  end
			40: if (  red[40]==0 && blue[40]==0)begin red[40]=1;  end
			41: if (  red[41]==0 && blue[41]==0)begin red[41]=1;  end
			42: if (  red[42]==0 && blue[42]==0)begin red[42]=1;  end
			43: if (  red[43]==0 && blue[43]==0)begin red[43]=1;  end
			44: if (  red[44]==0 && blue[44]==0)begin red[44]=1;  end
			45: if (  red[45]==0 && blue[45]==0)begin red[45]=1;  end
			46: if (  red[46]==0 && blue[46]==0)begin red[46]=1;  end
			47: if (  red[47]==0 && blue[47]==0)begin red[47]=1;  end
			48: if (  red[48]==0 && blue[48]==0)begin red[48]=1;  end
			49: if (  red[49]==0 && blue[49]==0)begin red[49]=1;  end
			50: if (  red[50]==0 && blue[50]==0)begin red[50]=1;  end
			51: if (  red[51]==0 && blue[51]==0)begin red[51]=1;  end
			52: if (  red[52]==0 && blue[52]==0)begin red[52]=1;  end
			53: if (  red[53]==0 && blue[53]==0)begin red[53]=1;  end
			54: if (  red[54]==0 && blue[54]==0)begin red[54]=1;  end
			55: if (  red[55]==0 && blue[55]==0)begin red[55]=1;  end
			56: if (  red[56]==0 && blue[56]==0)begin red[56]=1;  end
			57: if (  red[57]==0 && blue[57]==0)begin red[57]=1;  end
			58: if (  red[58]==0 && blue[58]==0)begin red[58]=1;  end
			59: if (  red[59]==0 && blue[59]==0)begin red[59]=1;  end
			60: if (  red[60]==0 && blue[60]==0)begin red[60]=1;  end
			61: if (  red[61]==0 && blue[61]==0)begin red[61]=1;  end
			62: if (  red[62]==0 && blue[62]==0)begin red[62]=1;  end
			63: if (  red[63]==0 && blue[63]==0)begin red[63]=1;  end
			endcase
		end
	end
	
	/*for (j = 0; j <= 60; j = j + 1)
	begin
		if (red[j] && red[j+1] && red[j+2] && red[j+3])
			p1win = 1;
		if (blue[j] && blue[j+1] && blue[j+2] && blue[j+3])
			p2win = 1;
		
		if (j == 4 || j == 12 || j == 20 || j == 28 || j == 36 || j == 44 || j == 52)
			i = i + 3;
	end
	
	for (m = 0; m <= 39; m = m + 8)
	begin
		if (red[m] && red[m+8] && red[m+16] && red[m+24])
			p1win = 1;
		if (blue[m] && blue[m+8] && blue[m+16] && blue[m+24])
			p2win = 1;
			
		if (m == 32 || m == 33 || m == 34 || m == 35 || m == 36 || m == 37 || m == 38)
			m = m - 39;
	end	
	
	if (p1win)
	begin
		p1Score = 4'b0001;
	end
	
	if (p2win)
	begin
		p1Score = 4'b0010;
	end
	*/
	
end

always@(red, blue)
begin
	for (j = 0; j <= 60; j = j + 1)
	begin
		if (red[j] && red[j+1] && red[j+2] && red[j+3])
			p1win = 1;
		if (blue[j] && blue[j+1] && blue[j+2] && blue[j+3])
			p2win = 1;
		
		if (j == 4 || j == 12 || j == 20 || j == 28 || j == 36 || j == 44 || j == 52)
			j = j + 3;
	end
	
	for (m = 0; m <= 39; m = m + 8)
	begin
		if (red[m] && red[m+8] && red[m+16] && red[m+24])
			p1win = 1;
		if (blue[m] && blue[m+8] && blue[m+16] && blue[m+24])
			p2win = 1;
			
		if (m == 32 || m == 33 || m == 34 || m == 35 || m == 36 || m == 37 || m == 38)
			m = m - 39;
	end	

	
end

// checking for connection
endmodule
