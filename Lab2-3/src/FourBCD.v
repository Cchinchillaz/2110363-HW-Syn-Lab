`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 01/01/2025 02:15:10 AM
// Design Name: BCD_Counter
// Module Name: FourBCD
// Project Name: BCD_Counter
// Target Devices: Basys3
// Tool Versions: 2023.2
// Description: The Four Digit BCD Counter Module
//////////////////////////////////////////////////////////////////////////////////


module FourBCD (
    input wire [3:0] Trigger,
    input wire Clk,
    input wire Reset,
    output wire [15:0] DataOut
);
  // Add your code here
  wire cout1,cout2,cout3,cout4;
  
  SingleBCD sg1(
    .Trigger(Trigger),
    .Clk(Clk),
    .Reset(Reset),
    .Cin(1'b0),
    .DataOut(DataOut[3:0]),
    .Cout(cout1)
    );
    
   SingleBCD sg2(
    .Trigger(Trigger),
    .Clk(Clk),
    .Reset(Reset),
    .Cin(cout1),
    .DataOut(DataOut[7:4]),
    .Cout(cout2)
    );
    
    SingleBCD sg3(
    .Trigger(Trigger),
    .Clk(Clk),
    .Reset(Reset),
    .Cin(cout2),
    .DataOut(DataOut[11:8]),
    .Cout(cout3)
    );
    
    SingleBCD sg4(
    .Trigger(Trigger),
    .Clk(Clk),
    .Reset(Reset),
    .Cin(cout3),
    .DataOut(DataOut[15:12]),
    .Cout(cout4)
    );
  // End of your code
endmodule
