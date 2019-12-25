`timescale 1ns / 1ps


module serial_test(
    );
    logic clk_100mhz;
    logic reset;
    logic btnu;
    logic [7:0] val;
    logic data;
    
    serial_tx uut (.clk(clk_100mhz), .reset(reset), .trigger(btnu), .val(val), .data_out(data));
    
    always begin
        #5;  //every 5 ns switch...so period of clock is 10 ns...100 MHz clock
        clk_100mhz = !clk_100mhz;
    end
    
    initial begin
        clk_100mhz = 0;
        reset = 0;
        btnu = 0;
        #10000;
        reset = 1;
        #10;
        reset = 0;
        #40;
        val[7:0] = 8'b0000_0000;
        #10;
        btnu = 1;
        #10;
        btnu = 0;
        #500;
    end
    
endmodule
