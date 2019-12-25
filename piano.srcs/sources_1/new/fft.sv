//`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Mitchell Gu
// Project Name: Nexys4 FFT Demo
//////////////////////////////////////////////////////////////////////////////////

module nexys4_fft_demo (
    input wire CLK100MHZ,
    input wire [15:0] SW, 
    input wire BTNC, BTNU, BTNL, BTNR, BTND,
    input wire AD3P, AD3N,  // The top pair of ports on JXADC on Nexys 4
    output wire [3:0] VGA_R, 
    output wire [3:0] VGA_B, 
    output wire [3:0] VGA_G,
    output wire VGA_HS, 
    output wire VGA_VS, 
    output wire AUD_PWM, AUD_SD,
    output wire LED16_B, LED16_G, LED16_R,
    output wire LED17_B, LED17_G, LED17_R,
    output wire [15:0] LED, // LEDs above switches
    output wire [7:0] SEG,  // segments A-G (0-6), DP (7)
    output wire [7:0] AN,   // Display 0-7
    output wire [1:0] JA    // serial output port
    );

    // SETUP CLOCKS
    // 104Mhz clock for XADC and primary clock domain
    // It divides by 4 and runs the ADC clock at 26Mhz
    // And the ADC can do one conversion in 26 clock cycles
    // So the sample rate is 1Msps (not posssible w/ 100Mhz)
    // 65Mhz for VGA Video
    wire clk_104mhz, clk_65mhz;
    clk_wiz_0 clockgen(
        .clk_in1(CLK100MHZ),
        .clk_out1(clk_104mhz),
        .clk_out2(clk_65mhz));

    // INSTANTIATE XVGA SIGNALS (1024x768)
    wire [10:0] hcount;
    wire [9:0] vcount;
    wire hsync, vsync, blank;
    xvga xvga1(
        .vclock(clk_65mhz),
        .hcount(hcount),
        .vcount(vcount),
        .vsync(vsync),
        .hsync(hsync),
        .blank(blank));

    // Parametrized debounce module to do all 16 switches and 5 buttons
    wire BTNC_clean, BTNU_clean, BTND_clean, BTNL_clean, BTNR_clean;
    wire [15:0] SW_clean;
    debounce #(.COUNT(21)) db0 (
        .clk(clk_104mhz),
        .reset(1'b0),
        .noisy({SW, BTNC, BTNU, BTND, BTNL, BTNR}),
        .clean({SW_clean, BTNC_clean, BTNU_clean, BTND_clean, BTNL_clean, BTNR_clean}));


// **************** END BASIC IO SETUP *******************************//

    wire [15:0] sample_reg;
    wire eoc, xadc_reset;
    // INSTANTIATE XADC IP
    xadc_demo xadc_demo (
        .dclk_in(clk_104mhz),  // Master clock for DRP and XADC. 
        .di_in(0),             // DRP input info (0 becuase we don't need to write)
        .daddr_in(6'h13),      // The DRP register address for the third analog input register
        .den_in(1),            // DRP enable line high (we want to read)
        .dwe_in(0),            // DRP write enable low (never write)
        .drdy_out(),           // DRP ready signal (unused)
        .do_out(sample_reg),   // DRP output from register (the ADC data)
        .reset_in(xadc_reset), // reset line
        .vp_in(0),             // dedicated/built in analog channel on bank 0
        .vn_in(0),             // can't use this analog channel b/c of nexys 4 setup
        .vauxp3(AD3P),         // The third analog auxiliary input channel
        .vauxn3(AD3N),         // Choose this one b/c it's on JXADC header 1
        .channel_out(),        // Not useful in sngle channel mode
        .eoc_out(eoc),         // Pulses high on end of ADC conversion
        .alarm_out(),          // Not useful
        .eos_out(),            // End of sequence pulse, not useful
        .busy_out()            // High when conversion is in progress. unused.
    );
    assign xadc_reset = BTNC_clean;

    // INSTANTIATE 16x OVERSAMPLING
    // This outputs 14-bit samples at a 62.5kHz sample rate
    // (2 more bits, 1/16 the sample rate)
    wire [13:0] osample16;
    wire done_osample16;
    oversample16 osamp16_1 (
        .clk(clk_104mhz),
        .sample(sample_reg[15:4]),
        .eoc(eoc),
        .oversample(osample16),
        .done(done_osample16));

    // INSTANTIATE SAMPLE FRAME BLOCK RAM 
    // This 16x4096 bram stores the frame of samples
    // The write port is written by osample16.
    // The read port is read by the bram_to_fft module and sent to the fft.
    wire fwe;
    reg [11:0] fhead = 0; // Frame head - a pointer to the write point, works as circular buffer
    wire [15:0] fsample;  // The sample data from the XADC, oversampled 15x
    wire [11:0] faddr;    // Frame address - The read address, controlled by bram_to_fft
    wire [15:0] fdata;    // Frame data - The read data, input into bram_to_fft
    bram_frame bram1 (
        .clka(clk_104mhz),
        .wea(fwe),
        .addra(fhead),
        .dina(fsample),
        .clkb(clk_104mhz),
        .addrb(faddr),
        .doutb(fdata));

    // SAMPLE FRAME BRAM WRITE PORT SETUP
    always @(posedge clk_104mhz) if (done_osample16) fhead <= fhead + 1; // Move the pointer every oversample
    assign fsample = {osample16, 2'b0}; // Pad the oversample with zeros to pretend it's 16 bits
    assign fwe = done_osample16; // Write only when we finish an oversample (every 104*16 clock cycles)

    // SAMPLE FRAME BRAM READ PORT SETUP
    // For this demo, we just need to display the FFT on 60Hz video, so let's only send the frame of samples
    // once every 60Hz. If you want to though, you can send frames much faster, one right after each other.
    // For this 4096pt fully pipelined FFT, the limit is 104Mhz/4096cycles_per_frame = 25kHz (approx)
    // The next two modules just synchronize the 60Hz vsync to the 104Mhz domain and convert it to a 1 cycle pulse.
    wire vsync_104mhz, vsync_104mhz_pulse;
    synchronize vsync_synchronize(
        .clk(clk_104mhz),
        .in(vsync),
        .out(vsync_104mhz));

    level_to_pulse vsync_ltp(
        .clk(clk_104mhz),
        .level(~vsync_104mhz),
        .pulse(vsync_104mhz_pulse));

    // INSTANTIATE BRAM TO FFT MODULE
    // This module handles the magic of reading sample frames from the BRAM whenever start is asserted,
    // and sending it to the FFT block design over the AXI-stream interface.
    wire last_missing; // All these are control lines to the FFT block design
    wire [31:0] frame_tdata;
    wire frame_tlast, frame_tready, frame_tvalid;
    bram_to_fft bram_to_fft_0(
        .clk(clk_104mhz),
        .head(fhead),
        .addr(faddr),
        .data(fdata),
        .start(vsync_104mhz_pulse),
        .last_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid)
    );

    // This is the FFT module, implemented as a block design with a 4096pt, 16bit FFT
    // that outputs in magnitude by doing sqrt(Re^2 + Im^2) on the FFT result.
    // It's fully pipelined, so it streams 4096-wide frames of frequency data as fast as
    // you stream in 4096-wide frames of time-domain samples.
    wire [23:0] magnitude_tdata; // This output bus has the FFT magnitude for the current index
    wire [11:0] magnitude_tuser; // This represents the current index being output, from 0 to 4096
    wire [11:0] scale_factor; // This input adjusts the scaling of the FFT, which can be tuned to the input magnitude.
    wire magnitude_tlast, magnitude_tvalid;
    fft_mag fft_mag_i(
        .clk(clk_104mhz),
        .event_tlast_missing(last_missing),
        .frame_tdata(frame_tdata),
        .frame_tlast(frame_tlast),
        .frame_tready(frame_tready),
        .frame_tvalid(frame_tvalid),
        .scaling(SW_clean[15:4]),
        .magnitude_tdata(magnitude_tdata),
        .magnitude_tlast(magnitude_tlast),
        .magnitude_tuser(magnitude_tuser),
        .magnitude_tvalid(magnitude_tvalid));

    // Let's only care about the range from index 0 to 1023, which represents frequencies 0 to omega/2
    // where omega is the nyquist frequency (sample rate / 2)
    wire in_range = ~|magnitude_tuser[11:10]; // When 13 and 12 are 0, we're on indexes 0 to 1023

    // Store 32 windows of FFTs, where each FFT is 1024 bins x 16 bit depth.
    // This is done with a linear index: FFTs in adjacent windows are placed
    // adjacent next to eachother, mod 32. This allows for comparison between
    // windows easily by changing the index.
    // log2(32 * 1024) => 15 bit address space
    // [14:10] => window index, [9:0] => FFT bin index
    logic [4:0] fft_window_index = 0;
    logic [9:0] fft_bin_index = 0;
    logic [14:0] fft_index;
    assign fft_index = {fft_window_index, fft_bin_index};
    // 16 bit depth describes the magnitude of the frequency in that bin
    logic [15:0] fft_magnitude;
    fft_windows fft_windows0(
        .clk(clk_104mhz),
        .wea(in_range & magnitude_tvalid),
        .addra({5'b00000, magnitude_tuser[9:0]}),
        .dina(magnitude_tdata[15:0]),
        .addrb(fft_index),
        .doutb(fft_magnitude)
        );


    fft_spectrogram spectrogram(
        .vclk_in(clk_65mhz),
        .hcount(hcount), .vcount(vcount), .blank(blank),
        .hsync(hsync), .vsync(vsync),
        .rgb({VGA_R, VGA_G, VGA_B}),
        .fft_bin_index(fft_bin_index),
        .fft_magnitude(fft_magnitude),
        .hsync_out(VGA_HS),
        .vsync_out(VGA_VS)
        );

    // Assign RGB LEDs
    assign {LED16_R, LED16_G, LED16_B} = {0, 0, music_clk};
    
    // The number of note changes we need to uniquely identify
    // to play the entirety of the song.
    parameter NUM_CHANGES = 2_000;

    // The number of sequences we need to uniquely identify
    // to play the entirety of the song. NUM_SEQS * sample_duration
    // gives the maximum length of a song.
    parameter NUM_SEQS = 10_000;

    logic system_reset;
    assign system_reset = BTNC_clean;

    logic is_recording;
    
    // Beat clock. How quickly the notes can change.
    logic music_clk;

    mega_clk_div mega_clk_div0(
        .clk_in(clk_65mhz),
        .clk_out(music_clk));
    
    // interop between the start_end_detector
    // and the music_storage.
    logic [1:0] note_change [11:0];
    logic [13:0] note_change_index;
    logic note_clk;
    
    // Playback on the LEDs.
    start_end_detector detector0(
        .rst_in(system_reset),
        .activated_notes_in(SW[11:0]),
        .note_clk_in(music_clk & is_recording),
        .note_change_out(note_change),
        .note_change_index_out(note_change_index),
        .note_change_clk_out(note_clk)
        );

    // Counter is the time, seq_ptr is the index.
    logic [$clog2(NUM_SEQS)-1:0] counter;
    logic [$clog2(NUM_CHANGES)-1:0] ptr;

    display_8hex display(
        .clk(clk_65mhz),
        .data({5'b00000, ptr[10:0], 2'b00, counter[13:0]}),
        .seg(SEG[6:0]),
        .strobe(AN));
    assign SEG[7] = 1; 

    logic fft_done = 1'b1;

    logic is_playing;
    assign LED17_G = is_playing;
    
    assign LED17_R = is_recording;
    
    logic [3:0] state;

    fsm fsm0(
           .clk_in(music_clk),
           .rst_in(system_reset),
           .fft_done(fft_done),
           .state_out(state),
           .counter(counter),
           .recording_in(BTNL_clean), .playing_in(BTNR_clean),
           .playing_out(is_playing), .recording_out(is_recording), .processing_out(LED17_B));

    logic [13:0] notes_indexes [10:0];
    logic [11:0] notes_stored [10:0];

    logic note_clk_with_reset;
    assign note_clk_with_reset = note_clk | system_reset;

    music_storage music_storage0(
        .rst_in(system_reset),
        .note_change_in(note_change),
        .note_change_index_in(note_change_index),
        .note_change_clk_in(note_clk_with_reset),
        .notes_stored(notes_stored),
        .notes_indexes(notes_indexes));
        
    logic [15:0] led_proxy;
    assign LED[11:0] = led_proxy[11:0];
    assign LED[15:12] = state[3:0];
    
    logic fft_clk;
    assign fft_clk = music_clk | system_reset;
    
    // interface with serial output to ESP32
    logic [7:0] motor_addy; // 8 bit address of the motor to be actuated
    logic [7:0] key_addy;   // 8 bit address of motor of interest,
                            // specified by value of motor_count
    logic [3:0] motor_count;// counter to 12 motor streams
    logic       trigger;    // trigger to send serial info
    logic       done;       // trigger from serial to indicate full serial stream sent
    logic       beat_trig;  // trigger set from new beat, to be read from 100Mhz clk seq
    logic       sending;
    logic       curr_beat;
    logic       old_beat;

    always_ff @(posedge fft_clk) begin
        // operates according to the beat clock (min 2hz, max 10hz)
        if (system_reset) begin
            ptr <= 0;
            beat_trig <= 0;
            led_proxy[11:0] <= 12'b0;
        // If recording.
        end else if (is_recording) begin
            led_proxy[11:0] <= SW[11:0];
            beat_trig <= 0;
        // If playing.
        end else if (is_playing) begin
            // Play out the notes onto the LEDs.
            led_proxy[11:0] <= notes_stored[ptr][11:0];
            if (notes_indexes[ptr + 1] >= counter)
                ptr <= ptr + 1;
            beat_trig       <= 1;
        end else begin
            led_proxy[11:0] <= 12'b0;
            beat_trig       <= 0;
        end
    end
    
    serial_tx hands (.clk(CLK100MHZ), .reset(system_reset), .trigger(trigger),
                    .val(motor_addy), .data_out(JA[0]), .done(done));
    
    addressKeyMap motorKey (.countIn(motor_count), .addrOut(key_addy));
    
    always_ff @(posedge CLK100MHZ) begin
        curr_beat       <= fft_clk;
        old_beat        <= curr_beat;
        if (system_reset) begin
            trigger     <= 0;
            sending     <= 0;
            motor_count <= 4'd0;
        end else if (curr_beat*~old_beat*beat_trig) begin
            sending     <= 1;
            motor_count <= 4'd0;
        end else if (motor_count >= 12) begin
            sending     <= 0;
        end else if (sending) begin
            motor_count <= done*(motor_count + 1) + ~done*(motor_count);
            trigger     <= done;
            motor_addy  <= notes_stored[ptr][motor_count]*key_addy + 
                          ~notes_stored[ptr][motor_count]*8'b1111_1111;
        end
    end

endmodule