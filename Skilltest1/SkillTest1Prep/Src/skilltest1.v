`timescale 1ns / 1ps

module skilltest1 (
    input  wire       Clk,
    input  wire       Reset,
    input  wire [3:0] Trigger,
    output wire [3:0] BCD0,
    output wire [3:0] BCD1,
    output wire [3:0] BCD2,
    output wire [3:0] BCD3
);
    reg [14:0] bcd;
    reg[3:0] bcd0,bcd1,bcd2,bcd3;
    reg[16:0] Counter;
    assign BCD0 = bcd0;
    assign BCD1 = bcd1;
    assign BCD2 = bcd2;
    assign BCD3 = bcd3;
    
    always @(posedge Clk) begin
        if(Reset) begin
            bcd <= 1;
            Counter <= 0;
        end
        else begin
            if(Trigger != 0) begin
               if(Counter == 0) begin
                if(bcd <= 9999) begin
                    case(Trigger)
                        4'b0001: bcd <= bcd+1;
                        4'b0010: bcd <= bcd+2;
                        4'b0100: bcd <= bcd*2;
                        4'b1000: bcd <= bcd*3;
                        default: bcd <= bcd;
                    endcase
                end
               end
               if(Counter < 1023) Counter <= Counter + 1;
            end
            // Trigger = 0
            else if(Counter > 0 && Counter < 1023) Counter <= Counter + 1;
            else Counter <= 0;
        end
        
        if(Reset || bcd <= 9999) begin
            bcd0 = bcd%10;
            bcd1 = (bcd/10)%10;
            bcd2 = (bcd/100)%10;
            bcd3 = (bcd/1000)%10;
        end
        else begin
            bcd0 = 4'b1111;
            bcd1 = 4'b1111;
            bcd2 = 4'b1111;
            bcd3 = 4'b1111;
        end
    end
endmodule 