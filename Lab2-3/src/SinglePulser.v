`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 01/01/2025 02:12:30 AM
// Design Name: BCD_Counter
// Module Name: SinglePulser
// Project Name: BCD_Counter
// Target Devices: Basys3
// Tool Versions: 2023.2
// Description: Single Pulser Module
//////////////////////////////////////////////////////////////////////////////////


module SinglePulser (
    input  wire DataIn,
    input  wire Clk,
    input  wire Reset,
    output wire DataOut
);
  // Add your code here
    reg [1:0] State;
    reg CurrData = 0;
    assign DataOut = CurrData;
    always @(posedge Clk) begin
        if(Reset) begin
            State <= 2'b00;
            CurrData <= 0;
        end
        else if(State == 2'b00 && DataIn) begin
            State <= 2'b01;
            CurrData <= 1;
        end
        else if(State == 2'b01) begin
            State <= DataIn? 2'b10:2'b00;
            CurrData <= 0;
        end
        else if(State == 2'b10 && !DataIn) begin
            State <= 2'b00;
            CurrData <= 0;
        end
    end
  // End of your code
endmodule
