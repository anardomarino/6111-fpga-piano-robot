// The finite state machine. This represents the different possible
// states the piano playing robot can enter, as a superposition
// of possible environment observables.
// Author: Brendan Ashworth
module fsm(clk_in, rst_in,
           fft_done,
           counter,
           state_out,
           recording_in, playing_in,
           playing_out, recording_out, processing_out);

    // The number of note changes we need to uniquely identify
    // to play the entirety of the song.
    parameter NUM_CHANGES = 2_000;

    // The number of sequences we need to uniquely identify
    // to play the entirety of the song. NUM_SEQS * sample_duration
    // gives the maximum length of a song.
    parameter NUM_SEQS = 10_000;

    // System
    input logic clk_in;
    input logic rst_in;
    
    // Signifies that the FFT is done with processing
    // data.
    input logic fft_done;
    
    // User inputs
    // recording_in is a switch
    input logic recording_in;
    // playing_in is a switch
    input logic playing_in;
    
    // We output information about the state as information
    // about the environment.
    output logic playing_out;
    output logic recording_out;
    output logic processing_out;
    
    // State storage.
    logic [3:0] state;
    
    output logic [3:0] state_out;
    assign state_out = state;
    
    // Counter for song playback.
    // Each tick (+1) in this counter represents
    // a window length for the FFT.
    output logic [$clog2(NUM_SEQS)-1:0] counter;
    logic [$clog2(NUM_SEQS)-1:0] length;
    
    // Each state can be broken down into environment states.
    const int ENV_PROCESSING = 4'b0010;
    assign processing_out = (state & ENV_PROCESSING) == ENV_PROCESSING;
    
    const int ENV_PLAYING = 4'b0001;
    assign playing_out = (state & ENV_PLAYING) == ENV_PLAYING;
    
    const int ENV_RECORDING = 4'b0100;
    assign recording_out = (state & ENV_RECORDING) == ENV_RECORDING;
    
    const int ENV_IDLE = 4'b1000;
    
    // Represent each state as a combination of those
    // environments.
    const logic [3:0] STATE_PLAY = ENV_PLAYING;
    const logic [3:0] STATE_PAUSED = 0; // paused represents none of the environments
    const logic [3:0] STATE_RECORDING = ENV_PROCESSING | ENV_RECORDING;
    const logic [3:0] STATE_ANALYZING = ENV_PROCESSING;
    const logic [3:0] STATE_IDLE = ENV_IDLE;
    
    always_ff @(posedge clk_in) begin
        if (rst_in) begin
            // If reset is high, transition to the idle state.
            state <= STATE_IDLE;
            // Reset the counter, length.
            counter <= 0;
            length <= 255; // TODO change
        end else begin
            // Handle state transitions based on inputs.
            if (state == STATE_PLAY) begin
                // If we stop playing transition to paused.
                if (!playing_in)
                    state <= STATE_PAUSED;
                // The counter reaching the song length means we're done with playback.
                else if (counter == length)
                    state <= STATE_IDLE;
                else begin
                    // We're currently playing the song,
                    // increment the counter.
                    counter <= counter + 1;
                end
            end else if (state == STATE_PAUSED) begin
                // If we hit the play button continue/start.
                if (playing_in)
                    state <= STATE_PLAY;
            end else if (state == STATE_RECORDING) begin
                // If the user stops recording, transition to finish analyzing.
                if (!recording_in)
                    state <= STATE_ANALYZING;
            end else if (state == STATE_ANALYZING) begin
                counter <= 0;
            
                // Analyzing continues as the FFT finishes in the pipeline.
                // However long FFT takes, we wait for it to finish before allowing
                // the user to continue with playback.
                // FFT signifies it's done with analyzing with an input signal of
                // fft_done. fft_done is low when it's processing real audio data.
                if (fft_done)
                    state <= STATE_PAUSED;
            end else if (state == STATE_IDLE) begin
                // Resetting the system automatically transitions us
                // to the idle state, and so does a song finishing playback.
                // The user can begin recording by hitting the recording switch.
                if (recording_in)
                    state <= STATE_RECORDING;
            end
        end
    end
    
endmodule