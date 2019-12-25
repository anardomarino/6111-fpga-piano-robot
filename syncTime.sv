//////////////////////////////////////////////////////////////////
//
// syncTime.sv
// Anthony Nardomarino
// FPGA Piano Playing Robot
// MIT 6.111 Digital Systems Lab
// 11-15-2019
//
//////////////////////////////////////////////////////////////////

module syncTime(
	input clk,
	output logic stream
);
	logic state = 0; // 0 when planning, 1 when executing
	freqKeyMap freqMap (.freqIn(), .keyOut());

endmodule // syncTime

