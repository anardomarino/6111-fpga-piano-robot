`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// serial_tx.sv
// Created by: Anthony Nardomarino
// 6.111 - Digital Systems Laboratory
// Piano Playing Robot
// 12-02-2019
//
// Based off of 6.111 Lab 2, in which Serial communications are established
// between a serial python reader and the FPGA. This module takes instructions
// and sends them via 8N1 UART to an ESP32
// with a precalculated baud of 115200 (100Mhz clock / 868).
//
//////////////////////////////////////////////////////////////////////////////////


module serial_tx(
        clk, reset, trigger, val, data_out, done
    );
    input   logic       clk;    // operates from a 100Mhz clock for a 115.2khz conversion
    input   logic       reset;
    input   logic       trigger;
    input   logic [7:0] val;
    output  logic       data_out;
    output  logic       done;   // signifies successful shift of bitstream
    
    parameter DIVISOR = 868; // 115.2 kbps baud divisor from 100Mhz
    
    logic [7:0]     shift_buffer;
    logic [31:0]    counter;
    
    always_ff @(posedge clk)begin
        if(reset)begin
            counter <= 32'd0;
            done    <= 1;
            shift_buffer <= 8'b11111111;
        end else begin
            if (counter != 8*DIVISOR) begin
                counter <= counter + 1;
            end
            if (trigger) begin
                shift_buffer[7:0] <= val[7:0];
                counter <= 32'd0;
                done    <= 0;
            end
            case(counter[14:0]) 
                DIVISOR*0: data_out <= shift_buffer[7];
                DIVISOR*1: data_out <= shift_buffer[6];
                DIVISOR*2: data_out <= shift_buffer[5];
                DIVISOR*3: data_out <= shift_buffer[4];
                DIVISOR*4: data_out <= shift_buffer[3];
                DIVISOR*5: data_out <= shift_buffer[2];
                DIVISOR*6: data_out <= shift_buffer[1];
                DIVISOR*7: data_out <= shift_buffer[0];
                DIVISOR*8: begin
                                data_out <= 1'b1;
                                done     <= 1;
                           end
                default:   data_out <= data_out;
            endcase
        end
    end
    
endmodule
