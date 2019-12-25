`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// serialToKey.sv
// Created by: Anthony Nardomarino
// 6.111 - Digital Systems Laboratory
// Piano Playing Robot
// 12-02-2019
//
// Interface for reading motor strategy BRAM and sending instructions
// via the serial_tx.sv module to an ESP32, which uses an I2C protocol
// to address motor arrays (consisting of 12 motors). Operation uses
// a 8N1 UART serial communication protocol between FPGA and ESP32,
// necessitating an 8 bit address for the motors (5 bits followed by
// 3 zeros)
//
//////////////////////////////////////////////////////////////////////////////////


module serialToKey(
        clk,    rst,
        pb,     ht,
        pinout
    );
    
    parameter TBINS     = 300;      // preset time bin size for
                                    // strategy settings
                                    
    parameter DIVISOR   = 10000000; // amt of clock cycles for
                                    // a clock of 10hz
    
    // INPUTS
    input   logic       clk;        // 100mhz
    input   logic       rst;        // reset
    input   logic       pb;         // playback start
    input   logic       ht;         // halftime pb
    
    // OUTPUTS
    output  logic       pinout;     // Serial output pin (ja[0])
    
    // INTERNAL LOGIC
    logic               trigger;    // begin serial bitstream
    logic   [7:0]       val;        // motor i2c address
    logic   [11:0]      key;        // 12-bit one-hot key identifier
    logic   [23:0]      cyclecount; // counts clock cycles to 10000000
    logic   [9:0]       bincount;   // counts tenths of a second in half
                                    // speed (up to the parameter TBINS size
    
    always_ff @(posedge clk) begin
        
        // reset trigger
        trigger <= 0;
        
        // reset logic
        if (rst) begin
            cyclecount  <= 24'd0;
            bincount    <= 10'd0;
            val         <=  8'd0;
        end
        
        // playback logic
        if (pb) begin
            cyclecount  <= (cyclecount + ~ht + 1 >= DIVISOR)
                                ? 24'd0 : cyclecount + ~ht + 1;
            bincount    <= (cyclecount + ~ht + 1 >= DIVISOR) 
                                ? bincount + 1 : bincount;
        end
        
        if (cyclecount + ~ht + 1 >= DIVISOR) begin
            trigger <= 1;
        end
    end
    
    //                i2c Address Key:
    //
    // 0100_0000 - A     0101_0000 - C#   0100_1000 - F
    // 0010_0000 - A#    0011_0000 - D    0010_1000 - F#
    // 0110_0000 - B     0111_0000 - D#   0110_1000 - G
    // 0001_0000 - C     0000_1000 - E    0001_1000 - G#
    
    // instantiate serial communication interface
    serial_tx serial    (.clk(clk), .reset(rst), .trigger(trigger), 
                    .val(val), .data_out(pinout));
    
endmodule // serialToKey