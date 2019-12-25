// The music storage module stores all recorded note changes
// as a two-dimensional logic array. It's from this music storage
// module that the music FSM reads and loads notes to send
// to the controls modules.
// Author: Brendan Ashworth
module music_storage(
    rst_in,
    note_change_in,
    note_change_index_in,
    note_change_clk_in,
    notes_stored,
    notes_indexes);

    input logic rst_in;
    // Clocked in when a note change is found by the start_end_detector.
    input logic note_change_clk_in;

    // This is the number of fundamental notes / frequencies
    // that the piano can play. This is a result of applying
    // the fundamental isolator on the activated frequencies in
    // the Fourier transform.
    parameter NUM_NOTES = 12;

    // The number of note changes we need to uniquely identify
    // to play the entirety of the song.
    parameter NUM_CHANGES = 2_000;

    // The number of sequences we need to uniquely identify
    // to play the entirety of the song. NUM_SEQS * sample_duration
    // gives the maximum length of a song.
    parameter NUM_SEQS = 10_000;

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
    input logic [1:0] note_change_in [NUM_NOTES-1:0];

    // Starting at 0, this is the index for a note change.
    // It will increment with every clock and can be used
    // to uniquely identify the activated frequencies in
    // a song at any point in time.
    input logic [$clog2(NUM_SEQS)-1:0] note_change_index_in;
    
    // The actual storage array. We need to store information
    // about the notes that change at what time periods.
    // This necessitates two logical 2d arrays: one for notes,
    // one to index the time periods.
    
    // Activations for each note at a certain time index.
    // This is effectively the LSB of note_change_in across the notes.
    output logic [NUM_NOTES-1:0] notes_stored [$clog2(NUM_CHANGES)-1:0];
    
    // Time indexes for each stored note. For each entry in notes_stored[i], there
    // is an equivalent entry in notes_indexes[i] that describes the time period at
    // which this note change occurs.
    output logic [$clog2(NUM_SEQS)-1:0] notes_indexes [$clog2(NUM_CHANGES)-1:0];
    
    // index_pointer contains a time index that indicates at which notes location
    // we should store the next note. Storing this prevents traversing the logic
    // until the notes_index[j] == 0, which is conceptually the same.
    logic [$clog2(NUM_CHANGES)-1:0] index_pointer;

    always_ff @(posedge note_change_clk_in) begin
        integer i;
        if (rst_in) begin
            // The music storage module uses two-dimensional logics.
            // This will unroll under synthesis, but we need to zero
            // it all out when we have a reset.
            integer i;
            for (i=0; i < $clog2(NUM_CHANGES); i++) begin
                notes_stored[i] <= 0;
                notes_indexes[i] <= 0;
            end
            // Begin writing at t=1.
            index_pointer <= 1;
        end else begin
            // Store the new note.
            notes_indexes[index_pointer] <= note_change_index_in;
            
            // Store each note activation individually because it comes
            // in as a [1:0] but we only care about the LSB.
            for (i=0; i < NUM_NOTES; i++) begin
                notes_stored[index_pointer][i] <= note_change_in[i][0];
            end
            
            // Increment the pointer.
            index_pointer <= index_pointer + 1;
        end
    end

endmodule
