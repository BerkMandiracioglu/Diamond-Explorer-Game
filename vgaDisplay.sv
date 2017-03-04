`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2016 11:44:31 PM
// Design Name: 
// Module Name: vgaDisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module vgaDisplay(
  input wire vgaClock,			
  input reg [9:0] horizontalPos,
  input reg[9:0] verticalPos,
  input wire reset,			
  input reg [7:0][9:0][2:0] arr ,

  output wire hsync,		
  output wire vsync,	
  output reg [3:0] red,	
  output reg [3:0] green, 
  output reg [3:0] blue	

);

  // video structure constants
  parameter hpixels = 800;// horizontal pixels per line
  parameter vlines = 521; // vertical lines per frame
  parameter hpulse = 96; 	// hsync pulse length
  parameter vpulse = 2; 	// vsync pulse length
  parameter hbp = 144; 	// end of horizontal back porch
  parameter hfp = 784; 	// beginning of horizontal front porch
  parameter vbp = 31; 		// end of vertical back porch
  parameter vfp = 511; 	// beginning of vertical front porch
 

  reg [9:0] hc;
  reg [9:0] vc;


  always @(posedge vgaClock or posedge reset)
    begin

   
      if (reset == 1)
        begin
          hc <= 0;
          vc <= 0;
        end
      else

        begin
          
          if (hc < hpixels - 1)
            hc <= hc + 1;
          else
           
            begin
              hc <= 0;
              if (vc < vlines - 1)
                vc <= vc + 1;
              else
                vc <= 0;
            end

        end


    end


  assign hsync = (hc < hpulse) ? 0:1;
  assign vsync = (vc < vpulse) ? 0:1;



  always @(*)
    begin
     
      if(hc>horizontalPos+2&&hc<28+horizontalPos&&vc>verticalPos+2&&vc<verticalPos+28) begin 
        red = 4'b0000;
        green = 4'b1111;
        blue = 4'b0000;
      end



      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+50&&vc<vbp+80&&arr[0][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+50&&vc<vbp+80&&arr[0][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+50&&vc<vbp+80&&arr[0][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+50&&vc<vbp+80&&arr[0][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+50&&vc<vbp+80&&arr[0][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+50&&vc<vbp+80&&arr[1][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+50&&vc<vbp+80&&arr[1][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+50&&vc<vbp+80&&arr[1][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+50&&vc<vbp+80&&arr[1][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+50&&vc<vbp+80&&arr[1][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+50&&vc<vbp+80&&arr[2][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+50&&vc<vbp+80&&arr[2][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+50&&vc<vbp+80&&arr[2][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+50&&vc<vbp+80&&arr[2][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+50&&vc<vbp+80&&arr[2][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+50&&vc<vbp+80&&arr[3][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+50&&vc<vbp+80&&arr[3][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+50&&vc<vbp+80&&arr[3][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+50&&vc<vbp+80&&arr[3][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+50&&vc<vbp+80&&arr[3][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+50&&vc<vbp+80&&arr[4][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+50&&vc<vbp+80&&arr[4][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+50&&vc<vbp+80&&arr[4][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+50&&vc<vbp+80&&arr[4][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+50&&vc<vbp+80&&arr[4][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+50&&vc<vbp+80&&arr[5][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+50&&vc<vbp+80&&arr[5][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+50&&vc<vbp+80&&arr[5][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+50&&vc<vbp+80&&arr[5][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+50&&vc<vbp+80&&arr[5][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+50&&vc<vbp+80&&arr[6][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+50&&vc<vbp+80&&arr[6][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+50&&vc<vbp+80&&arr[6][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+50&&vc<vbp+80&&arr[6][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+50&&vc<vbp+80&&arr[6][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+50&&vc<vbp+80&&arr[7][0]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+50&&vc<vbp+80&&arr[7][0]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+50&&vc<vbp+80&&arr[7][0]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+50&&vc<vbp+80&&arr[7][0]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+50&&vc<vbp+80&&arr[7][0]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+80&&vc<vbp+110&&arr[0][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+80&&vc<vbp+110&&arr[0][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+80&&vc<vbp+110&&arr[0][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+80&&vc<vbp+110&&arr[0][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+80&&vc<vbp+110&&arr[0][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+80&&vc<vbp+110&&arr[1][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+80&&vc<vbp+110&&arr[1][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+80&&vc<vbp+110&&arr[1][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+80&&vc<vbp+110&&arr[1][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+80&&vc<vbp+110&&arr[1][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+80&&vc<vbp+110&&arr[2][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+80&&vc<vbp+110&&arr[2][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+80&&vc<vbp+110&&arr[2][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+80&&vc<vbp+110&&arr[2][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+80&&vc<vbp+110&&arr[2][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+80&&vc<vbp+110&&arr[3][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+80&&vc<vbp+110&&arr[3][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+80&&vc<vbp+110&&arr[3][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+80&&vc<vbp+110&&arr[3][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+80&&vc<vbp+110&&arr[3][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+80&&vc<vbp+110&&arr[4][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+80&&vc<vbp+110&&arr[4][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+80&&vc<vbp+110&&arr[4][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+80&&vc<vbp+110&&arr[4][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+80&&vc<vbp+110&&arr[4][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+80&&vc<vbp+110&&arr[5][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+80&&vc<vbp+110&&arr[5][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+80&&vc<vbp+110&&arr[5][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+80&&vc<vbp+110&&arr[5][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+80&&vc<vbp+110&&arr[5][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+80&&vc<vbp+110&&arr[6][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+80&&vc<vbp+110&&arr[6][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+80&&vc<vbp+110&&arr[6][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+80&&vc<vbp+110&&arr[6][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+80&&vc<vbp+110&&arr[6][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+80&&vc<vbp+110&&arr[7][1]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+80&&vc<vbp+110&&arr[7][1]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+80&&vc<vbp+110&&arr[7][1]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+80&&vc<vbp+110&&arr[7][1]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+80&&vc<vbp+110&&arr[7][1]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+110&&vc<vbp+140&&arr[0][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+110&&vc<vbp+140&&arr[0][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+110&&vc<vbp+140&&arr[0][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+110&&vc<vbp+140&&arr[0][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+110&&vc<vbp+140&&arr[0][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+110&&vc<vbp+140&&arr[1][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+110&&vc<vbp+140&&arr[1][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+110&&vc<vbp+140&&arr[1][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+110&&vc<vbp+140&&arr[1][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+110&&vc<vbp+140&&arr[1][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+110&&vc<vbp+140&&arr[2][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+110&&vc<vbp+140&&arr[2][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+110&&vc<vbp+140&&arr[2][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+110&&vc<vbp+140&&arr[2][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+110&&vc<vbp+140&&arr[2][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+110&&vc<vbp+140&&arr[3][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+110&&vc<vbp+140&&arr[3][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+110&&vc<vbp+140&&arr[3][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+110&&vc<vbp+140&&arr[3][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+110&&vc<vbp+140&&arr[3][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+110&&vc<vbp+140&&arr[4][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+110&&vc<vbp+140&&arr[4][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+110&&vc<vbp+140&&arr[4][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+110&&vc<vbp+140&&arr[4][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+110&&vc<vbp+140&&arr[4][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+110&&vc<vbp+140&&arr[5][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+110&&vc<vbp+140&&arr[5][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+110&&vc<vbp+140&&arr[5][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+110&&vc<vbp+140&&arr[5][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+110&&vc<vbp+140&&arr[5][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+110&&vc<vbp+140&&arr[6][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+110&&vc<vbp+140&&arr[6][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+110&&vc<vbp+140&&arr[6][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+110&&vc<vbp+140&&arr[6][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+110&&vc<vbp+140&&arr[6][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+110&&vc<vbp+140&&arr[7][2]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+110&&vc<vbp+140&&arr[7][2]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+110&&vc<vbp+140&&arr[7][2]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+110&&vc<vbp+140&&arr[7][2]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+110&&vc<vbp+140&&arr[7][2]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+140&&vc<vbp+170&&arr[0][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+140&&vc<vbp+170&&arr[0][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+140&&vc<vbp+170&&arr[0][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+140&&vc<vbp+170&&arr[0][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+140&&vc<vbp+170&&arr[0][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+140&&vc<vbp+170&&arr[1][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+140&&vc<vbp+170&&arr[1][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+140&&vc<vbp+170&&arr[1][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+140&&vc<vbp+170&&arr[1][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+140&&vc<vbp+170&&arr[1][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+140&&vc<vbp+170&&arr[2][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+140&&vc<vbp+170&&arr[2][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+140&&vc<vbp+170&&arr[2][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+140&&vc<vbp+170&&arr[2][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+140&&vc<vbp+170&&arr[2][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+140&&vc<vbp+170&&arr[3][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+140&&vc<vbp+170&&arr[3][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+140&&vc<vbp+170&&arr[3][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+140&&vc<vbp+170&&arr[3][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+140&&vc<vbp+170&&arr[3][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+140&&vc<vbp+170&&arr[4][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+140&&vc<vbp+170&&arr[4][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+140&&vc<vbp+170&&arr[4][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+140&&vc<vbp+170&&arr[4][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+140&&vc<vbp+170&&arr[4][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+140&&vc<vbp+170&&arr[5][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+140&&vc<vbp+170&&arr[5][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+140&&vc<vbp+170&&arr[5][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+140&&vc<vbp+170&&arr[5][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+140&&vc<vbp+170&&arr[5][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+140&&vc<vbp+170&&arr[6][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+140&&vc<vbp+170&&arr[6][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+140&&vc<vbp+170&&arr[6][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+140&&vc<vbp+170&&arr[6][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+140&&vc<vbp+170&&arr[6][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+140&&vc<vbp+170&&arr[7][3]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+140&&vc<vbp+170&&arr[7][3]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+140&&vc<vbp+170&&arr[7][3]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+140&&vc<vbp+170&&arr[7][3]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+140&&vc<vbp+170&&arr[7][3]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+170&&vc<vbp+200&&arr[0][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+170&&vc<vbp+200&&arr[0][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+170&&vc<vbp+200&&arr[0][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+170&&vc<vbp+200&&arr[0][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+170&&vc<vbp+200&&arr[0][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+170&&vc<vbp+200&&arr[1][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+170&&vc<vbp+200&&arr[1][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+170&&vc<vbp+200&&arr[1][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+170&&vc<vbp+200&&arr[1][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+170&&vc<vbp+200&&arr[1][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+170&&vc<vbp+200&&arr[2][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+170&&vc<vbp+200&&arr[2][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+170&&vc<vbp+200&&arr[2][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+170&&vc<vbp+200&&arr[2][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+170&&vc<vbp+200&&arr[2][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+170&&vc<vbp+200&&arr[3][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+170&&vc<vbp+200&&arr[3][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+170&&vc<vbp+200&&arr[3][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+170&&vc<vbp+200&&arr[3][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+170&&vc<vbp+200&&arr[3][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+170&&vc<vbp+200&&arr[4][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+170&&vc<vbp+200&&arr[4][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+170&&vc<vbp+200&&arr[4][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+170&&vc<vbp+200&&arr[4][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+170&&vc<vbp+200&&arr[4][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+170&&vc<vbp+200&&arr[5][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+170&&vc<vbp+200&&arr[5][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+170&&vc<vbp+200&&arr[5][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+170&&vc<vbp+200&&arr[5][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+170&&vc<vbp+200&&arr[5][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+170&&vc<vbp+200&&arr[6][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+170&&vc<vbp+200&&arr[6][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+170&&vc<vbp+200&&arr[6][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+170&&vc<vbp+200&&arr[6][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+170&&vc<vbp+200&&arr[6][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+170&&vc<vbp+200&&arr[7][4]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+170&&vc<vbp+200&&arr[7][4]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+170&&vc<vbp+200&&arr[7][4]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+170&&vc<vbp+200&&arr[7][4]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+170&&vc<vbp+200&&arr[7][4]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+200&&vc<vbp+230&&arr[0][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+200&&vc<vbp+230&&arr[0][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+200&&vc<vbp+230&&arr[0][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+200&&vc<vbp+230&&arr[0][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+200&&vc<vbp+230&&arr[0][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+200&&vc<vbp+230&&arr[1][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+200&&vc<vbp+230&&arr[1][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+200&&vc<vbp+230&&arr[1][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+200&&vc<vbp+230&&arr[1][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+200&&vc<vbp+230&&arr[1][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+200&&vc<vbp+230&&arr[2][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+200&&vc<vbp+230&&arr[2][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+200&&vc<vbp+230&&arr[2][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+200&&vc<vbp+230&&arr[2][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+200&&vc<vbp+230&&arr[2][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+200&&vc<vbp+230&&arr[3][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+200&&vc<vbp+230&&arr[3][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+200&&vc<vbp+230&&arr[3][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+200&&vc<vbp+230&&arr[3][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+200&&vc<vbp+230&&arr[3][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+200&&vc<vbp+230&&arr[4][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+200&&vc<vbp+230&&arr[4][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+200&&vc<vbp+230&&arr[4][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+200&&vc<vbp+230&&arr[4][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+200&&vc<vbp+230&&arr[4][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+200&&vc<vbp+230&&arr[5][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+200&&vc<vbp+230&&arr[5][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+200&&vc<vbp+230&&arr[5][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+200&&vc<vbp+230&&arr[5][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+200&&vc<vbp+230&&arr[5][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+200&&vc<vbp+230&&arr[6][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+200&&vc<vbp+230&&arr[6][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+200&&vc<vbp+230&&arr[6][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+200&&vc<vbp+230&&arr[6][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+200&&vc<vbp+230&&arr[6][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+200&&vc<vbp+230&&arr[7][5]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+200&&vc<vbp+230&&arr[7][5]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+200&&vc<vbp+230&&arr[7][5]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+200&&vc<vbp+230&&arr[7][5]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+200&&vc<vbp+230&&arr[7][5]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+230&&vc<vbp+260&&arr[0][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+230&&vc<vbp+260&&arr[0][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+230&&vc<vbp+260&&arr[0][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+230&&vc<vbp+260&&arr[0][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+230&&vc<vbp+260&&arr[0][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+230&&vc<vbp+260&&arr[1][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+230&&vc<vbp+260&&arr[1][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+230&&vc<vbp+260&&arr[1][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+230&&vc<vbp+260&&arr[1][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+230&&vc<vbp+260&&arr[1][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+230&&vc<vbp+260&&arr[2][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+230&&vc<vbp+260&&arr[2][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+230&&vc<vbp+260&&arr[2][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+230&&vc<vbp+260&&arr[2][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+230&&vc<vbp+260&&arr[2][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+230&&vc<vbp+260&&arr[3][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+230&&vc<vbp+260&&arr[3][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+230&&vc<vbp+260&&arr[3][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+230&&vc<vbp+260&&arr[3][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+230&&vc<vbp+260&&arr[3][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+230&&vc<vbp+260&&arr[4][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+230&&vc<vbp+260&&arr[4][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+230&&vc<vbp+260&&arr[4][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+230&&vc<vbp+260&&arr[4][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+230&&vc<vbp+260&&arr[4][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+230&&vc<vbp+260&&arr[5][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+230&&vc<vbp+260&&arr[5][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+230&&vc<vbp+260&&arr[5][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+230&&vc<vbp+260&&arr[5][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+230&&vc<vbp+260&&arr[5][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+230&&vc<vbp+260&&arr[6][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+230&&vc<vbp+260&&arr[6][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+230&&vc<vbp+260&&arr[6][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+230&&vc<vbp+260&&arr[6][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+230&&vc<vbp+260&&arr[6][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+230&&vc<vbp+260&&arr[7][6]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+230&&vc<vbp+260&&arr[7][6]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+230&&vc<vbp+260&&arr[7][6]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+230&&vc<vbp+260&&arr[7][6]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+230&&vc<vbp+260&&arr[7][6]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+260&&vc<vbp+290&&arr[0][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+260&&vc<vbp+290&&arr[0][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+260&&vc<vbp+290&&arr[0][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+260&&vc<vbp+290&&arr[0][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+260&&vc<vbp+290&&arr[0][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+260&&vc<vbp+290&&arr[1][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+260&&vc<vbp+290&&arr[1][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+260&&vc<vbp+290&&arr[1][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+260&&vc<vbp+290&&arr[1][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+260&&vc<vbp+290&&arr[1][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+260&&vc<vbp+290&&arr[2][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+260&&vc<vbp+290&&arr[2][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+260&&vc<vbp+290&&arr[2][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+260&&vc<vbp+290&&arr[2][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+260&&vc<vbp+290&&arr[2][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+260&&vc<vbp+290&&arr[3][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+260&&vc<vbp+290&&arr[3][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+260&&vc<vbp+290&&arr[3][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+260&&vc<vbp+290&&arr[3][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+260&&vc<vbp+290&&arr[3][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+260&&vc<vbp+290&&arr[4][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+260&&vc<vbp+290&&arr[4][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+260&&vc<vbp+290&&arr[4][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+260&&vc<vbp+290&&arr[4][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+260&&vc<vbp+290&&arr[4][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+260&&vc<vbp+290&&arr[5][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+260&&vc<vbp+290&&arr[5][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+260&&vc<vbp+290&&arr[5][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+260&&vc<vbp+290&&arr[5][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+260&&vc<vbp+290&&arr[5][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+260&&vc<vbp+290&&arr[6][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+260&&vc<vbp+290&&arr[6][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+260&&vc<vbp+290&&arr[6][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+260&&vc<vbp+290&&arr[6][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+260&&vc<vbp+290&&arr[6][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+260&&vc<vbp+290&&arr[7][7]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+260&&vc<vbp+290&&arr[7][7]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+260&&vc<vbp+290&&arr[7][7]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+260&&vc<vbp+290&&arr[7][7]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+260&&vc<vbp+290&&arr[7][7]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+290&&vc<vbp+320&&arr[0][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+290&&vc<vbp+320&&arr[0][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+290&&vc<vbp+320&&arr[0][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+290&&vc<vbp+320&&arr[0][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+290&&vc<vbp+320&&arr[0][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+290&&vc<vbp+320&&arr[1][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+290&&vc<vbp+320&&arr[1][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+290&&vc<vbp+320&&arr[1][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+290&&vc<vbp+320&&arr[1][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+290&&vc<vbp+320&&arr[1][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+290&&vc<vbp+320&&arr[2][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+290&&vc<vbp+320&&arr[2][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+290&&vc<vbp+320&&arr[2][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+290&&vc<vbp+320&&arr[2][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+290&&vc<vbp+320&&arr[2][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+290&&vc<vbp+320&&arr[3][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+290&&vc<vbp+320&&arr[3][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+290&&vc<vbp+320&&arr[3][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+290&&vc<vbp+320&&arr[3][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+290&&vc<vbp+320&&arr[3][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+290&&vc<vbp+320&&arr[4][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+290&&vc<vbp+320&&arr[4][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+290&&vc<vbp+320&&arr[4][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+290&&vc<vbp+320&&arr[4][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+290&&vc<vbp+320&&arr[4][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+290&&vc<vbp+320&&arr[5][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+290&&vc<vbp+320&&arr[5][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+290&&vc<vbp+320&&arr[5][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+290&&vc<vbp+320&&arr[5][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+290&&vc<vbp+320&&arr[5][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+290&&vc<vbp+320&&arr[6][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+290&&vc<vbp+320&&arr[6][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+290&&vc<vbp+320&&arr[6][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+290&&vc<vbp+320&&arr[6][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+290&&vc<vbp+320&&arr[6][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+290&&vc<vbp+320&&arr[7][8]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+290&&vc<vbp+320&&arr[7][8]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+290&&vc<vbp+320&&arr[7][8]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+290&&vc<vbp+320&&arr[7][8]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+290&&vc<vbp+320&&arr[7][8]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+320&&vc<vbp+350&&arr[0][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+320&&vc<vbp+350&&arr[0][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+320&&vc<vbp+350&&arr[0][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+320&&vc<vbp+350&&arr[0][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+240&& hc <hbp+270&&vc>vbp+320&&vc<vbp+350&&arr[0][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+320&&vc<vbp+350&&arr[1][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+320&&vc<vbp+350&&arr[1][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+320&&vc<vbp+350&&arr[1][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+320&&vc<vbp+350&&arr[1][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+270&& hc <hbp+300&&vc>vbp+320&&vc<vbp+350&&arr[1][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+320&&vc<vbp+350&&arr[2][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+320&&vc<vbp+350&&arr[2][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+320&&vc<vbp+350&&arr[2][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+320&&vc<vbp+350&&arr[2][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+300&& hc <hbp+330&&vc>vbp+320&&vc<vbp+350&&arr[2][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+320&&vc<vbp+350&&arr[3][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+320&&vc<vbp+350&&arr[3][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+320&&vc<vbp+350&&arr[3][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+320&&vc<vbp+350&&arr[3][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+330&& hc <hbp+360&&vc>vbp+320&&vc<vbp+350&&arr[3][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+320&&vc<vbp+350&&arr[4][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+320&&vc<vbp+350&&arr[4][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+320&&vc<vbp+350&&arr[4][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+320&&vc<vbp+350&&arr[4][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+360&& hc <hbp+390&&vc>vbp+320&&vc<vbp+350&&arr[4][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+320&&vc<vbp+350&&arr[5][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+320&&vc<vbp+350&&arr[5][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+320&&vc<vbp+350&&arr[5][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+320&&vc<vbp+350&&arr[5][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+390&& hc <hbp+420&&vc>vbp+320&&vc<vbp+350&&arr[5][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+320&&vc<vbp+350&&arr[6][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+320&&vc<vbp+350&&arr[6][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+320&&vc<vbp+350&&arr[6][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+320&&vc<vbp+350&&arr[6][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+420&& hc <hbp+450&&vc>vbp+320&&vc<vbp+350&&arr[6][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+320&&vc<vbp+350&&arr[7][9]==3'b000)
        begin
          red = 4'b1111;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+320&&vc<vbp+350&&arr[7][9]==3'b001)
        begin
          red = 4'b0000;
          green  = 4'b1111;
          blue=4'b1111;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+320&&vc<vbp+350&&arr[7][9]==3'b010)
        begin
          red = 4'b1001;
          green  = 4'b1001;
          blue=4'b1001;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+320&&vc<vbp+350&&arr[7][9]==3'b011)
        begin
          red = 4'b1111;
          green  = 4'b0000;
          blue=4'b0000;
        end
      else if (hc>hbp+450&& hc <hbp+480&&vc>vbp+320&&vc<vbp+350&&arr[7][9]==3'b100)
        begin
          red = 4'b1111;
          green  = 4'b0111;
          blue=4'b1111;
        end




      else begin 
        red = 3'b000;
        green = 3'b000;
        blue = 2'b00;

      end


      // we're outside active horizontal range so display black


      // we're outside active vertical range so display black

    end

endmodule
