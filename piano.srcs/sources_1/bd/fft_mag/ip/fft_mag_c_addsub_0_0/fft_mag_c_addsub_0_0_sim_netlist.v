// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Mon Dec  2 14:00:29 2019
// Host        : eecs-digital-32 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/a/n/anthonyn/6111-piano-playing-robot/piano.srcs/sources_1/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0_sim_netlist.v
// Design      : fft_mag_c_addsub_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_c_addsub_0_0,c_addsub_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module fft_mag_c_addsub_0_0
   (A,
    B,
    CE,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "32" *) 
  (* c_add_mode = "0" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000000000000000000" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "32" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_13 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "1" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_c_addsub_0_0_c_addsub_v12_0_13
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire \<const0> ;
  wire [31:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "32" *) 
  (* c_add_mode = "0" *) 
  (* c_ainit_val = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000000000000000000" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_latency = "0" *) 
  (* c_out_width = "32" *) 
  (* c_sinit_val = "0" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_c_addsub_0_0_c_addsub_v12_0_13_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
hkYW+OZm6k9gF5yAUfXGm/n8kfXYD6tjFQYha968Ws0SqrM/NNAjCrrtMG8kIqTbkipnmceefxNr
sB0PtSpUrw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NEPpD4CxNBVJLV3hg1agn83QnqiCz3YuR89MlVuNyQGERKVJ+uGolFDqHFzBKLQArFTiHBWivkzK
A2DQ42XdOxp30NKOgHjrjgmF+fZMjDs24rn3Ue1INLHwTS5RT84Kih7Jx/7R0dl03/COJq+33l9u
7l+ArdY7mLwqqI9iIjU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cfBwEwc95LpKuxDGqpON2gGac620iHNKrm/QNXYg3/OFA5ZQNdpdhRz4vCTQRVbOg7b1nIox6GR8
TD/cf0JW38RU0NuY+TR6CkFT19NCdy67gR6JTDdXifhr/zTKjOL5gvp0XjT9PSLwwPyDirNX4TMa
9y9X5pf4gEnt0dikHNgySZO+Qpr30MP7n6oAjuxowlf45cfmPqZthYPnIjBSCdQGBPfSF+kZ2F1N
XCDEja5xE4CQshPPodH5njadc6kj7/qp9C4PfKcyNtDug+qsws9UK25Z2IFc8vk6/15HlIkQHkXv
Wq0iHaPLidqh3035FinHyPD/FDnfGGa5Oa2qcg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QmjD3HAHcP+h0RsjR0iH8h2N6drNxei50nfQN9RC8HobMEaARq/6rKjZEhHXMSCStQeCMhyVKRmN
HM7ZrqMf3W0s/8U4QMqp3M1VuYXVjEe2PCIpvtRcMY3JngdSWOydG2dH6dDA16ehxinMKgIr0TjA
PXA+lfyX6yTs1FWrne/6ufrl6ZAPpNG7EDKQ2aHqSm8DEXT1BJYMblBfAjAajwaJmPEu1aDlQeNo
onryTiFJkKP92pcZLCCufZL8ZAJ5uMvZZxiZRsiLd0BnCfOe3rl9AON+q53U+iK11EvAkpIBT+Cc
VYb5NqVAVaqXbQrqo3+YHEW5ft3fM9kZnlFDew==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FkHW107swc8fPv4xOTlQJU6PWERObturlywl6rsGCswc/v367bmQ1Maze/8QdmUPjEYwhAcHKVMu
7U4o3CvYhmrDpYiUQdQQ0B7gAbMZbJ8MFY5jRxn7KYDk+Bi9Ov8092IdW1a51FPWEVPmF4Kn6z4E
DSqpQDL58qieEUnrU2Ltb4GLJc3NrWTLvnbvRtHUUuQWTMZTQ7WqX4iH2dZ/EICpbRjlAF50iMAS
YHuuFTRKXcIFQlKYRyeQV4nyaA5JGbb3RC3N/Q2IZjdSXqQ9EOpmdhttpxReCnsdJiD/pPCtf7ZN
d/TheLy1Va2FZR+p4MozZorVui5/FtcCwKy6aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NgZm/7Jvy0UZQRVxBVxeZ/odxMd59IlnRFHjM+6Bof6o6u4Qy4u9MOoQ3Sr2paPuGq+B+5EhdcD8
a5WGiurBrPW0qF+L2CoUJsDqz0WonRehZECQynibSUlmctvvMyr790pwb+C78gtW47p8uALYdUCJ
NhcDkV8fE3jFdDEYmfQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxQNdd2WOThZCBZEYNgXxai4jK9AqWD/GRadYnarEfzmLUfcNDUoG7DxVWHCdTVuW8i2qZpouT1H
FUHt76rzZk8vI2tFLfUbKyTaRqik1aYwOCp1ZdqbgqQEDhBRWJjGxcJuxZbSQ2z8IUgiJ0eT148+
nf9UmzvYS1jrIsN/a7K4EjyRNMk0V917y85rxdk7itlisaUw4Cm72z9slByFtALj6/077uPjcK9U
mbWm7PbXk8PT44eQeaJl990wlWvD5/8BZS6AHqjg8520Xs+jftSeB6aNqTiYxfp21FJqmexwo7cG
G3BH/DRHhP7ZIsXHqSaJJFo20Nx9VgpLuF5t2g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qKTOoeYhFsruY4ZhypK6vFKD5VG5181gPUQXjRNDjuMNT4j2DnYGMNgISjDMRc0NZn/qsUJYdatX
sINYsYxSKilePEGhnbEnPKJpOBEDanaweWjZQ3bd1i4eNB9fe3Sm6t5r4r2NBwRJqAw+Yfbg8jIU
3SBNrIOleP+k1jPqes7vmqKjr+OvpBrUDNs8ieusUXPToDc2qmmtqJcd44J+v6hp7qtTgRuvbdta
T4zwsPUqHHvvW28Cu2PyTuzLS8IbRRK4CgzG/VEcVjuOI4qWwzsnqLh2OU6H7u4+6R8VL4yxeC9N
QZQU8diPXQu7NteV8+0jN0PKpv4YQN/dAI34Qw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xMUVtDNA4rWC0/QyeQHQi1bTMeDypsNXFdCVZDw4VjQw1U/WKKmvalzEoc3KJOSV0ye1LVwWXRy6
blP4oaQ1wI0sPAP69cr1gODqRqA1jDEa4q/qCWIc3Ida0OZdHF+5awd2lBg0YKD2QSdKgARYqN17
tw8AH/UQA+/1uulb+wPIrRsP5atv9nuPEduI7w5x+5bYvXxH1wOpwMtm+oaQ2aEWnv66ivgemQaM
dBvglFkJ+P6KBtX/zO0Ehz00Qhu6FA3BxKltJtd6XX3qt+eyrbj85NzXvJI2YB32kdX9xXehbDfz
qMFuJAm9OgAk8PmmgxSyiVafxTWPYT6eFBwpJw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16400)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
