// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Wed Dec  4 23:42:05 2019
// Host        : eecs-digital-29 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /afs/athena.mit.edu/user/b/r/brendana/piano/piano.srcs/sources_1/ip/fft_windows/fft_windows_stub.v
// Design      : fft_windows
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1.2" *)
module fft_windows(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[1:0],addra[14:0],dina[15:0],clkb,enb,addrb[14:0],doutb[15:0]" */;
  input clka;
  input ena;
  input [1:0]wea;
  input [14:0]addra;
  input [15:0]dina;
  input clkb;
  input enb;
  input [14:0]addrb;
  output [15:0]doutb;
endmodule
