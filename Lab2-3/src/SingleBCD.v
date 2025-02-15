`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 01/01/2025 02:14:43 AM
// Design Name: BCD_Counter
// Module Name: SingleBCD
// Project Name: BCD_Counter
// Target Devices: Basys3
// Tool Versions: 2023.2
// Description: A single BCD counter module for 1 digit in a 4 digit BCD counter
//////////////////////////////////////////////////////////////////////////////////


module SingleBCD (
    input  wire       Trigger,
    input  wire       Clk,
    input  wire       Reset,
    input  wire       Cin,
    output wire [3:0] DataOut,
    output wire       Cout
);
  // Add your code here
  reg [3:0] CurrData = 0;
  assign DataOut = CurrData;
  assign Cout = CurrData + Trigger + Cin > 9;
  
  always @(posedge Clk) begin
    if(Reset) begin
        CurrData <= 0;
    end
    else if(CurrData + Trigger + Cin > 9) begin
        CurrData <= (CurrData + Trigger + Cin)% 10;
    end
    else begin
        CurrData <= CurrData + Trigger + Cin;
    end
  end
  // End of your code
endmodule
