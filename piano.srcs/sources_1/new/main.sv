//////////////////////////////////////////////////////////////////////////////////
// 
// main.sv
// Created by: Brendan Ashworth, Max Hardy, Anthony Nardomarino
// 6.111 - Digital Systems Laboratory
// Piano Playing Robot
// 12-11-2019
//
// Main interface for FPGA functionality in operating the "Piano Man" piano-
// playing robot. Implements a DSP block for receiving analog audio input
// from an e935 Sennheiser microphone amplifying circuit, processing with an 
// onboard ADC, performing a discrete FFT on the signal and assembling a limited
// spectrogram transformation. That transformation then gathers the playable
// frequencies and assembles a set of motor array instructions to be sent to the
// controls block. This is operated by a FSM, capable of beginning the recording
// process, playing back, and playing back at half speed. The controls block
// uses its assembled strategy to operate the array "hands" through an ESP32
// driving microcontroller through 8N1 UART Serial communications.
//
//////////////////////////////////////////////////////////////////////////////////

module main(CLK100MHZ, SW, BTNU, BTNR, BTNC, BTNL, BTND, JA, AD3P, AD3N,
            LED16_R, LED16_G, LED16_B, LED17_R, LED17_G, LED17_B);

    input logic CLK100MHZ;
    input logic BTNC;
    input logic BTNL;
    input logic BTND;
    input logic BTNU; // debugging serial
    input logic BTNR; // debugging serial
    input logic [15:0] SW;
    input logic AD3P;
    input logic AD3N;
    
    // LEDs
    output logic LED16_R;
    output logic LED16_G;
    output logic LED16_B;
    output logic LED17_R;
    output logic LED17_G;
    output logic LED17_B;
    
    // Output pins
    output logic [1:0] JA;
    assign JA[1] = 0;
    
    // Debug switches
    logic old_debug_send1;
    logic debug_send1;
    logic old_debug_send2;
    logic debug_send2;
        
    logic playing_out;
    assign LED16_R = playing_out;
    
    logic recording_out;
    assign LED16_G = recording_out;
    
    logic processing_out;
    assign LED16_B = processing_out;
    
    always_ff @(posedge CLK100MHZ)begin
        old_debug_send1 <= debug_send1;
        old_debug_send2 <= debug_send2;
    end

    // Instantiate the piano finite state machine.
    fsm             piano   (.clk_in(CLK100MHZ), .rst_in(SW[0]),
                    .fft_done(SW[1]), .recording_in(SW[2]), 
                    .playing_in(SW[3]), .playing_out(playing_out), 
                    .recording_out(recording_out), 
                    .processing_out(processing_out));
            
    debounce        dbDeb   (.clk(CLK100MHZ), .reset(SW[0]), 
                    .noisy(BTNU), .clean(debug_send1));
    debounce        dbDer   (.clk(CLK100MHZ), .reset(SW[0]),
                    .noisy(BTNR), .clean(debug_send2));

endmodule