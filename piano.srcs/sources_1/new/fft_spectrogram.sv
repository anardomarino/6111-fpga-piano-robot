// Generates a visual spectrogram that contains
// VGA-generating display logic. This augments
// the audio output to provide another way to
// look at what the robot is doing.
// Author: Brendan Ashworth
module fft_spectrogram(
    vclk_in,
    hcount, vcount, blank,
    hsync, vsync,
    
    rgb,
    hsync_out, vsync_out,
    
    fft_bin_index,
    fft_magnitude
    );
    
    // Fixed screen parameters.
    parameter SCREEN_HEIGHT = 767;
    parameter SCREEN_HEIGHT_HALF = 383;
    parameter SCREEN_WIDTH = 1023;

    input logic vclk_in;
    
    input [10:0] hcount;
    input [9:0] vcount;
    
    input logic blank;
    input logic hsync;
    input logic vsync;

    output logic [11:0] rgb;
    
    output logic hsync_out;
    output logic vsync_out;
    
    // old
    output [9:0] fft_bin_index;
    input [15:0] fft_magnitude;
    logic [9:0] hheight;
    logic [9:0] vheight;
    logic blank1;
    logic [1:0] intensity;
    
    // COLORS is the color spectrum that we use to generate the spectrogram.
    // This makes it visually pleasing but not computationally or space
    // intensive.
    parameter [11:0] COLOR_RED = 12'hD11;
    parameter [11:0] COLOR_ORANGE = 12'hF84;
    parameter [11:0] COLOR_YELLOW = 12'hFD0;
    parameter [11:0] COLOR_BLACK = 12'h000;
    
    always_ff @(posedge vclk_in) begin
        // We pipeline to allow for some computation, so
        // delay all logics equally.
        hheight <= fft_magnitude >> 7;
        vheight <= SCREEN_HEIGHT - vcount;
        // Intensity depends on the FFT magnitude.
        intensity <= {hheight > 210, hheight > 20};
        blank1 <= blank;
        {hsync_out, vsync_out} <= {hsync, vsync};

        rgb <= blank ? COLOR_BLACK :
               // First, filter out what shouldn't be colored.
               // Center the spectrogram on half screen height.
               (vheight > (SCREEN_HEIGHT_HALF + hheight)) ? COLOR_BLACK :
               (vheight < (SCREEN_HEIGHT_HALF - hheight)) ? COLOR_BLACK :
               // Now do it based on intensity.
               (intensity[1]) ? COLOR_RED :
               (intensity[0]) ? COLOR_ORANGE :
               COLOR_YELLOW;
    end

    // 1 bin per pixel, with the selected range
    assign fft_bin_index = hcount[9:0] >> 3;

endmodule
