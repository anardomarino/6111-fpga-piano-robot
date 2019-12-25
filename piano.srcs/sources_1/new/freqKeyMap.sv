//////////////////////////////////////////////////////////////////
//
// addressKeyMap.sv
// Anthony Nardomarino
// FPGA Piano Playing Robot
// MIT 6.111 Digital Systems Lab
// 11-15-2019
//
//////////////////////////////////////////////////////////////////


    //                i2c Address Key:
    //
    // 0100_0000 - A     0101_0000 - C#   0100_1000 - F
    // 0010_0000 - A#    0011_0000 - D    0010_1000 - F#
    // 0110_0000 - B     0111_0000 - D#   0110_1000 - G
    // 0001_0000 - C     0000_1000 - E    0001_1000 - G#

module addressKeyMap(
	input   logic   [4:0]	countIn,
	output	logic	[7:0]	addrOut
);
	logic [7:0] addr;
	
	assign addrOut = addr;
	
	always_comb begin
		case(countIn)
		  4'd0:       addr = 8'b0100_0000;
		  4'd1:       addr = 8'b0010_0000;
		  4'd2:       addr = 8'b0110_0000;
		  4'd3:       addr = 8'b0001_0000;
		  4'd4:       addr = 8'b0101_0000;
		  4'd5:       addr = 8'b0011_0000;
		  4'd6:       addr = 8'b0111_0000;
		  4'd7:       addr = 8'b0000_1000;
		  4'd8:       addr = 8'b0100_1000;
		  4'd9:       addr = 8'b0010_1000;
		  4'd10:      addr = 8'b0110_1000;
		  4'd11:      addr = 8'b0001_1000;
		  default:    addr = 8'b1111_1111;
		endcase
	end
endmodule // freqKeyMap
