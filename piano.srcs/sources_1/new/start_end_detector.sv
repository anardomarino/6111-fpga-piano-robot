// The start end detector effectively takes the
// derivative of an array of activated frequencies,
// giving the time indices at which they change in value
// (turn off or on). This transforms a step function in
// both directions to delta functions towards negative and
// positive infinity.
// Brendan Ashworth
module start_end_detector(
    rst_in,
    activated_notes_in,
    note_clk_in,
    note_change_out,
    note_change_index_out,
    note_change_clk_out
    );
    
    // This is the number of fundamental notes / frequencies
    // that the piano can play. This is a result of applying
    // the fundamental isolator on the activated frequencies in
    // the Fourier transform.
    parameter NUM_NOTES = 12;
    
    // The number of sequences we need to uniquely identify
    // to play the entirety of the song. NUM_SEQS * sample_duration
    // gives the maximum length of a song.
    parameter NUM_SEQS = 10_000;
    
    input logic rst_in;

    // An array of activated notes - a 0 signifies
    // the note is off, a 1 is on.
    input [NUM_NOTES-1:0] activated_notes_in;
    // note_clk_in pulses when a new sequence of activated notes
    // are introduced.
    input logic note_clk_in;
    
    // The delta functions that represent changes in
    // the activated frequencies. This also includes
    // information about the current activated frequency;
    // i.e., given a single note_change_out, you can
    // start playing a song at that point.
    // For some given frequency, note_change_out is:
    // 00 = no change in activation, off
    // 11 = no change, on
    // 10 = note turns off
    // 01 = note turns on
    // note_change_out is designed such that
    // note_change_out[0] ^ note_change_out[1]
    // signifies that the motors must be actuated in some
    // direction specified by note_change_out[0].
    output logic [1:0] note_change_out [NUM_NOTES-1:0];
    
    // Starting at 0, this is the index for a note change.
    // It will increment with every clock and can be used
    // to uniquely identify the activated frequencies in
    // a song at any point in time.
    output logic [$clog2(NUM_SEQS)-1:0] note_change_index_out;

    // The activated notes on the last clock pulse.
    // The same value as the LSB of note_change_out for
    // all notes.
    logic last_activated_notes [NUM_NOTES-1:0];
    
    // Whether or not that specific frequency has a change.
    // OR ing this entire logic will provide a logical 1 if
    // there is a note change detected.
    logic note_has_change [NUM_NOTES-1:0];
    
    logic note_xor;
    // TODO: generate this from some NUM_NOTES.
    assign note_xor = note_has_change[0]
                    | note_has_change[1]
                    | note_has_change[2]
                    | note_has_change[3]
                    | note_has_change[4]
                    | note_has_change[5]
                    | note_has_change[6]
                    | note_has_change[7]
                    | note_has_change[8]
                    | note_has_change[9]
                    | note_has_change[10]
                    | note_has_change[11];

    // expose_clk is a mask for the outgoing note change clock.
    logic expose_clk;

    // This clk pulses any time there is a new note_change_out
    // available to process.
    output logic note_change_clk_out;
    assign note_change_clk_out = expose_clk & note_xor;

    always_ff @(posedge note_clk_in) begin
        if (rst_in) begin
            for (integer i = 0; i < NUM_NOTES; i++) begin
                note_change_out[i] <= 2'b00;
                last_activated_notes[i] <= 0;
            end
        
            note_change_index_out <= 0;
            expose_clk <= 0;
        end else if (note_change_clk_out) begin
            // Turn off the clock out if it was on.
            // Technically speaking this disallows the start end detector
            // from detecting changes that happen immediately after another
            // change, but this is short-lived for the duration of one
            // sample. In other words, for the real piano this doesn't
            // actually matter, and if anything will improve performance
            // by smoothing the outcoming notes.
            expose_clk <= 0;
            
            for (integer i = 0; i < NUM_NOTES; i++)
                note_has_change[i] <= 0;
            
        end else begin
            // If we just clocked the pulse, unpulse.
            // Go through each individual note.
            for (integer i = 0; i < NUM_NOTES; i++) begin
                // Let [1] be the last note.
                // Let [0] be the current activated note.
                note_change_out[i] <= {last_activated_notes[i], activated_notes_in[i]};
                
                // The clock should pulse if any change exists.
                note_has_change[i] <= last_activated_notes[i] ^ activated_notes_in[i];
                
                // Store the old notes so we don't reactivate on the same one.
                last_activated_notes[i] <= activated_notes_in[i];
            end
            
            // Increment the index.
            note_change_index_out <= note_change_index_out + 1;
            
            // Allow the clock to pulse if the actual
            // notes have changed.
            expose_clk <= 1;
        end
    end

endmodule
