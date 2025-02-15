`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: BCD_Counter
// Module Name: SevenSegmentController
// Project Name: BCD_Counter
// Target Devices: Basys3
// Tool Versions: 2023.2
// Description: Controller module for 7-Segment Display
//////////////////////////////////////////////////////////////////////////////////


module SevenSegmentController #(
    parameter ControllerClockCycle   = 1,
    parameter ControllerCounterWidth = 1
) (
    input  wire       Reset,
    input  wire       Clk,
    output wire [3:0] AN,
    output wire [1:0] Selector
);
  reg [ControllerCounterWidth-1:0] Counter = 0;
  // Add your code here
  reg [3:0] ANOut;
  reg [1:0] SelectorOut;
  assign AN = ANOut;
  assign Selector = SelectorOut;
  
  always @(posedge Clk) begin
    if(Reset) begin
        Counter <= 0;
        ANOut <= 4'b1111;
        SelectorOut <= 0;
    end
    else if(Counter == ControllerClockCycle - 1) begin
        Counter <= 0;
        ANOut <= {ANOut[2:0],ANOut[3]};
        SelectorOut <= Selector + 1;
    end
    else begin
        Counter <= Counter + 1;
        ANOut <= (ANOut == 4'b1111)? 4'b1110 : ANOut;
    end
  end
  // End of your code
endmodule
