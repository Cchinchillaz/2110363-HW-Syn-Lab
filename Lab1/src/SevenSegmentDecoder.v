`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 12/23/2024 04:17:24 AM
// Design Name: Exercise1
// Module Name: SevenSegmentDecoder
// Project Name: Exercise1
// Target Devices: Basys3
// Tool Versions: 2023.2
// Description: Decoder for 7-segment display
//////////////////////////////////////////////////////////////////////////////////


module SevenSegmentDecoder (
    input  wire [3:0] DataIn,
    output wire [7:0] Segments
);
  // Add code here //
    reg [7:0] DataOut;
    assign Segments = DataOut;
    always @(*) begin 
        case(DataIn[3:0])
            4'b0000: DataOut = 8'b00000011;
            4'b0001: DataOut = 8'b10011111;
            4'b0010: DataOut = 8'b00100101;
            4'b0011: DataOut = 8'b00001101;
            4'b0100: DataOut = 8'b10011001;
            4'b0101: DataOut = 8'b01001001;
            4'b0110: DataOut = 8'b01000001;
            4'b0111: DataOut = 8'b00011111;
            4'b1000: DataOut = 8'b00000001;
            4'b1001: DataOut = 8'b00001001;
            4'b1010: DataOut = 8'b00010001;
            4'b1011: DataOut = 8'b11000001;
            4'b1100: DataOut = 8'b01100011;
            4'b1101: DataOut = 8'b10000101;
            4'b1110: DataOut = 8'b01100001;
            4'b1111: DataOut = 8'b01110001;
        endcase
     end  
  // End of code //

  // cocotb dump waveforms
`ifdef COCOTB_SIM
  initial begin
    $dumpfile("waveform.vcd");  // Name of the dump file
    $dumpvars(0, SevenSegmentDecoder);  // Dump all variables for the top module
  end
`endif
endmodule
