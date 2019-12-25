`timescale 1ns / 1ps

// To run this test bench, set the following constants in
// iterative_filter.sv:
// WINDOW_SIZE=12
// SAMPLE_DEPTH=4
// STEP_SIZE=2
// Brendan Ashworth
module iterative_filter_tb;

    logic clk_100mhz;
    logic reset;
    
    logic [3:0] mic_in;
    
    logic [3:0] window_out [11:0];
    logic clk_window_out;

    iterative_filter filter(.clk_in(clk_100mhz), .rst_in(reset), 
                        .mic_in(mic_in),
                        .window_out(window_out), .clk_window_out(clk_window_out));

    always begin
        #5;  //every 5 ns switch...so period of clock is 10 ns...100 MHz clock
        clk_100mhz = !clk_100mhz;
    end
    
    initial begin
        $display("Starting Sim"); //print nice message
        clk_100mhz = 0;
        reset = 1;
        #10;
        reset = 0;
        mic_in = 4'b0000;
        // initialize everything to 0
        #20;
        if (window_out[0] != 4'b0000)
            $error("window_out[0]", window_out[0]);
        mic_in = 4'b1010;
        #20;
        if (window_out[0] != 4'b1010)
            $error("window_out[0]", window_out[0]);
        if (window_out[2] != 4'b0000)
            $error("window_out[2]", window_out[2]);
        mic_in = 4'b0101;
        #20;
        if (window_out[0] != 4'b0101)
            $error("window_out[0]", window_out[0]);
        if (window_out[2] != 4'b1010)
            $error("window_out[2]", window_out[2]);
        mic_in = 4'b1111;
        #20;
        if (window_out[0] != 4'b1111)
            $error("window_out[0]", window_out[0]);
        if (window_out[2] != 4'b0101)
            $error("window_out[2]", window_out[2]);
        mic_in = 4'b0000;
        #20;
        if (window_out[0] != 4'b0000)
            $error("window_out[0]", window_out[0]);
        if (window_out[2] != 4'b1111)
            $error("window_out[2]", window_out[2]);
        #50;

        $display("done");
        $finish;
    end
endmodule