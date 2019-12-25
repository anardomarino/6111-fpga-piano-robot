`timescale 1ns / 1ps

// To run this testbench, set NUM_NOTES=12.
// Brendan Ashworth
module start_end_detector_tb;

    logic clk_100mhz;
    logic reset;
    
    logic [11:0] activated_notes_in;
    
    logic [1:0] note_change_out [11:0];
    logic note_change_clk_out;
    logic [13:0] note_change_index_out;

    start_end_detector detector(.rst_in(reset),
        .activated_notes_in(activated_notes_in),
        .note_clk_in(clk_100mhz),
        .note_change_out(note_change_out),
        .note_change_index_out(note_change_index_out),
        .note_change_clk_out(note_change_clk_out));

    always begin
        #5;  //every 5 ns switch...so period of clock is 10 ns...100 MHz clock
        clk_100mhz = !clk_100mhz;
    end
    
    initial begin
        $display("Starting Sim"); //print nice message
        clk_100mhz = 0;
        reset = 1;
        #50;
        reset = 0;
        activated_notes_in = 12'b0000_0000_0000;
        // initialize everything to 0
        #50;
        activated_notes_in = 12'b0000_0000_0000;
        #50;
        activated_notes_in = 12'b1111_0000_0000;
        #50;
        activated_notes_in = 12'b0000_1111_0000;
        #50;
        activated_notes_in = 12'b0000_0000_1111;
        #50;
        activated_notes_in = 12'b0101_0101_0101;
        #50;
        activated_notes_in = 12'b1010_1010_1010;
        $display("done");
        $finish;
    end
    
endmodule
