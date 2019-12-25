`timescale 1ns / 1ps


module readMic(
        input clk_100mhz,
        input logic [3:0] xa_p,
        output logic [3:0] out
    );
    
    ila_0 analyze(.clk(clk_100mhz), .probe0(xa_p));
    
    always_ff @(posedge clk_100mhz) begin
        out <= xa_p;
    end
    
endmodule
