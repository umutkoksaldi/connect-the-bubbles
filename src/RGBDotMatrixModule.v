`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:43:09 11/25/2015 
// Design Name: 
// Module Name:     
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
module RGBDotMatrixModule(
		input CLOCK,
		input [63:0] redmsg,
		input [63:0] bluemsg,
 		output  reg oe, //output enable
		
		output reg  SH_CP, // shift register clock pulse
		output reg ST_CP, // store register clock pulse
		
		output reg reset, // reset for the shift register
		
		output reg DS, // digital signal
		output reg [7:0] CAT
    );
	wire [24:1] message;
	reg [7:0] red ;
	reg [7:0] green;
	reg [7:0] blue;
	
	assign message[24:17] = red ;
	assign  message[16:9] = green;
	assign message[8:1] = blue;
	
	reg f;
	reg e;
	
	reg [3:0] counter;
	reg[8:0] i = 9'b00000001; // --data signalin seri olarak iletilmesini kontrol eder.
	reg[2:0] a = 3'b000;
	reg[9:0] d = 10'b0000000000;
	
	
	
	
	
	
	
	
	
	
	always@(posedge CLOCK)
	begin
		counter = counter+1;
		f<= counter[3]; // CLOCK signal for the shift register
		e<= ~f;
	end	
		//------------------------------------------------------------
	always@( posedge e)
		begin	
		//seri olarak datayý almak için her clock pulse tan sonra i bir arttýrýlýyor.
			i = i+9'b000000001;
		end	

	always@(*)
		begin
			if (i < 9'b000000100) // baþlangýçta i 4'e gelene kadar sisteme reset atýlýr.
				reset<=0;
			else
				reset<=1;
			if (i>9'b000000011 && i<9'b000011100) //4'le 27 arasýnda data akýþý seri olarak.
				DS<=message[i-9'b000000011];
			else 
				DS<=0;
				
			if (i<9'b000011100) //i 28'e geldiðinde data akýþý datamlanýyor.24 bit data alýnmýþ oluyor. bu sureden sonra clock durduluyor yeni data akýþýna kadar.
				begin
					SH_CP<=f;             
					ST_CP<=e;
				end
				
			else
				begin
					SH_CP<=0;
					ST_CP<=1;
				end
end
			always@(posedge f)//clock un durduðu surede OE=0 yani output registerin çýkýþýnda aktif durumda.
			begin
				if (i>9'b000011100 && i<9'b110011101)
					oe<=0;
				else
					oe<=1;
			end		

			always@( posedge f) //bir satýr tamamlandýðýnda a bir arttýrýlýyor 2. satýra geçmek için.
			begin	
				if (i==9'b110011110)
					begin
					a = a+1;
					//i <=9'b0;
					end
			end

			always@ ( posedge f) //satrlar ve sutunlar tamamlandýðýnda yeni görüntü için(ful ekran) d bir arttýrýlýyor.
			begin	
				if (i==9'b110011110)
					if (a==7) 
						d=d+1;
			end			
		//end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//a katotlarý taramak için kullanýlýyor.
	always@( a)
		begin	
				if (a==0) begin
					red = redmsg[7:0];
					green = 8'b00000000;
					blue = bluemsg[7:0];
					CAT<=8'b10000000;
				end
				else if (a==1) begin
			
					red = redmsg[15:8];
					green = 8'b00000000;
					blue = bluemsg[15:8];
					CAT<=8'b01000000;
				end
				
				else if (a==2) begin
					red = redmsg[23:16];
					green = 8'b00000000;
					blue = bluemsg[23:16];
					CAT<=8'b00100000;
				end
				
				else if (a==3) begin
					red = redmsg[31:24];
					green = 8'b00000000;
					blue = bluemsg[31:24];					
					CAT<=8'b00010000;
				end	
				
				else if (a==4) begin 
					red = redmsg[39:32];
					green = 8'b00000000;
					blue = bluemsg[39:32];
					CAT<=8'b00001000;
				end	
				
				else if (a==5) begin
					red = redmsg[47:40];
					green = 8'b00000000;
					blue = bluemsg[47:40];
					CAT<=8'b00000100;
				end	
				
				else if (a==6) begin
					red = redmsg[55:48];
					green = 8'b00000000;
					blue = bluemsg[55:48];
					CAT<=8'b00000010;
				end	
				
				else begin
					CAT<=8'b00000001;	
					red = redmsg[63:56];
					green = 8'b00000000;
					blue = bluemsg[63:56];
				end
		end
	
endmodule
