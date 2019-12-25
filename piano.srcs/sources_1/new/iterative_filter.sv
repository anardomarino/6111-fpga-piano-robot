// Iterative filter splits a continuous sampling
// of microphone signals (technically discrete)
// into much larger windows of a fixed number of samples.
// These samples, often overlapping with some step length,
// are clocked out to the fast fourier transform
// regularly as samples come in.
// Brendan Ashworth
module iterative_filter(clk_in, rst_in, 
                        mic_in,
                        window_out, clk_window_out);

    input logic clk_in;
    input logic rst_in;

    // Sample depth denotes the
    // bits needed to represent the microphone signal.
    parameter SAMPLE_DEPTH = 12; // testbench=4

    // Digital microphone input.
    // Use as a 24 bit depth signal.
    input [SAMPLE_DEPTH-1:0] mic_in;
   
    // These constants determine the window size
    // and step size for the iterative filter.
    // The window size denotes the number of samples
    // present in the FFT batch. The more samples,
    // the better resolution in frequency.
    // Each window will overlap with the next window.
    // The step size denotes how many samples pass before
    // resetting to a new window. If step size = window size,
    // they will not overlap. If step size = 1, a new
    // window will be generated for every sample.
    parameter WINDOW_SIZE = 8192; // testbench=12
    parameter STEP_SIZE = 256; // testbench=2
   
    // window_out provides the window with relevant data at the
    // time clk_window_out goes high.
    output logic [SAMPLE_DEPTH-1:0] window_out [WINDOW_SIZE-1:0];
    // clk_window_out goes high every time a new window is available
    // for the FFT.
    // This happens with frequency sample_clk/step_size.
    output logic clk_window_out;
    
    // Create a clock of 44.1khz, aka the sample
    // frequency of our microphone.
    logic sample_clk;
    // TODO, divide the clock so its the right frequency
    assign sample_clk = clk_in;

    // Store the window in memory.
    // The window is a bunch of samples.
    logic [SAMPLE_DEPTH-1:0] window [WINDOW_SIZE-1:0];
    
    // Index how far we are until the next step occurs.
    // When step_phase = STEP_SIZE, we clock out.
    logic [$clog2(SAMPLE_DEPTH)-1:0] step_phase;

    always_ff @(posedge sample_clk) begin
        if (rst_in) begin
            step_phase <= 0;
            clk_window_out <= 0;
        end else begin
            // When a new sample is available, shift it into
            // the window.
            window <= {window[WINDOW_SIZE-2:0], mic_in};
        
            if (step_phase == STEP_SIZE - 1) begin
                // With the new step, we have a new window available.
                // Shift this out and clock to FFT that it's available.
                clk_window_out <= 1;
                window_out <= window;
                
                step_phase <= 0;
            end else begin
                clk_window_out <= 0;
            
                step_phase <= step_phase + 1;
            end
        end
    end

endmodule