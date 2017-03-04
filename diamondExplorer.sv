`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2016 06:10:14 PM
// Design Name: 
// Module Name: NERP_demo_top
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

module diamondExplorer(
  input wire clk,			
  input wire reset,			
  input wire right,
  input wire left,
  input wire down,
  input wire up,
  output wire [6:0] seg,	
  output wire [3:0] an,	
  output wire dp,			
  output wire [3:0] red,	
  output wire [3:0] green,
  output wire [3:0] blue,	
  output wire hsync,		
  output wire vsync			
);

 
  wire segclk;
  wire logicClock;
  reg [7:0][9:0][2:0]arr ;
  reg [9:0] x;
  reg [9:0] y;
  reg [4:0] score;


  
  wire vgaClock;

 
  assign dp = 1;

  
  clockdivider divider(
    .clk(clk),
    .reset(reset),
    .vgaClock(vgaClock),
    .segclk(segclk),
    .logicClock(logicClock)


  );


  // 7-segment display controller
  segdisplay segmentation(

    .segclk(segclk),
    .score(score),
    .reset(reset),
    .seg(seg),
    .an(an)
  );

  gameLogic mechanic(
    .logicClock(logicClock),
    .reset(reset),

    .right(right),
    .left(left),
    .up(up), 
    .down(down), 
    .horizontalPos(x),
    .verticalPos(y),
    .arr(arr),
    .score(score)
  ); 


  // VGA controller
  vgaDisplay display(

    .vgaClock(vgaClock),
    .horizontalPos(x),
    .verticalPos(y),
    .reset(reset),
    .arr(arr),
    .hsync(hsync),
    .vsync(vsync),
    .red(red),
    .green(green),
    .blue(blue)

  );

endmodule
