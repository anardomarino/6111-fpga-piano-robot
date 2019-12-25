// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Mon Dec  2 14:01:33 2019
// Host        : eecs-digital-32 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/a/n/anthonyn/6111-piano-playing-robot/piano.srcs/sources_1/bd/fft_mag/ip/fft_mag_mult_gen_1_0/fft_mag_mult_gen_1_0_sim_netlist.v
// Design      : fft_mag_mult_gen_1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_1_0,mult_gen_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_15,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_1_0
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 104000000, PHASE 0.000, CLK_DOMAIN fft_mag_clk, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) output [31:0]P;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_15 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "16" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "31" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "mult_gen_v12_0_15" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fft_mag_mult_gen_1_0_mult_gen_v12_0_15
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [15:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [31:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [31:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "16" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "31" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fft_mag_mult_gen_1_0_mult_gen_v12_0_15_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
KGg++J83s0yJ7o2/XMVLkRRTRjS0oC9h86tQjl1+xE1m53Uwmm0+K41skiYHo3Urr6lMQ4q2jL5Y
R/1NOu1WGg==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jCBx8aLaNWpgdwu0tsffQfmLNKET4Uy44Upxw9AlkO9Ma9Y+tqZHrHroYhGJUxa/dyJZ7Z0HDJ1t
hUhVV6SjuhVMs1NLM1MVw9F3MTSW7MB/qx7j0WAj62FJgoxsCtt6g392p1JAAosX8yACeLKiQ0KF
mnMpugzqSRDI445k7So=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zdO8kU0uCj5Mggk0oLUcYcllNQJVD7vxIj25evesPPwBvXuv6EUsbKmUaCAlFUyG0YQ0mxWxXmzV
V/dRqKxqZ1ZI8+mX4IFaTJSCcYctMZsCl+2EWvQQHakV4QzWuCyca1phNacrRJfur8Ssc/Mhbez3
GLQCRrSfyBYyi3u9J+SAJRcJapyB1syXXhclDtup6m1z2C5S+NX/ql6kVXkcd9P+C5ordunfutgU
6uco8UymF/9QFYiBCWlTkHAgd7DH3dCI1E72N2H/KpX0/0xFBk++NCVuNucOwd9h4/hAyr4L+SI0
6Dzmn6kaBO4lnMAj5P58GIeWO/EtqrPeWg4UJw==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FdbUT4bIXyyFULrG0eEn0kqX6tjVoWssNb1FURO5jvyN5IkvkkDKCSLsd4J+2RE35ttJ20+4IZm2
p3H/UGCxkuCYtlZzovVpVf93DlhFUM2iSGd/L3evdLLL8VYETZTScGFdFXqiqe4ggXPHQCSEPD+e
PmMIJTGQka0DD3H+w+9t5Po/+M8b4r1y70l3Py7aYMeCEsZ/yHRmk8szsOjUbwvFEJk8SPXrEERg
EYMIrbryPHXq5E2fCL7hTgHa+bzIdFQOc2/8wn8YMVTmIJCZLBZDXvGSSm16cifWzXKHbPSly8js
RAoD2yYva4rr9cUy8jEyEpUcPGnaJXBDnB7lsQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eGYl/A3vBqVYodgklvBXVlduDkQKDOe941//b/7D71XaDbW1Cqv7m5eqy+I7bUTyBfnKRV6WeTtg
K2eZlSMADPLNGmIEawb1T81kHA95L4SgxCaMDbzt0t5pO+IQTca0KxjvPFPjj860AZ/Y4IJCgD9Z
vZNfcSeez7bqGB9kVNzxh40hdeBm7XY8a+5R/yPufF2S8KSSaiPSvYwD8yXOBzVoRhqA9q5PWKTd
u6qoeWMnQ1r/hIDsge5oDE06b6+zC7odC460K8KIOtKzeCrfWezkynmD7wBR1fdIwh9FGe2Uq4lO
ZbT2QFx8Ga5NQIwIIZZci/uL4Tw/7+CPKEoddw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
k1GN+kT7KgRIHJs5Cw+hQb7EZrReCsvXgXeCjz4o0RyqpPm8XlxoPCNX4kR8BSaVxBTPm8qGrOj8
IkQcLP4XpLGNjMzOE8knGvgjraCBhhY/bboSihIYbJYXuKW0k/ErxcqbMup3dsmp8N5M+ZYpiEuF
88HraBjchDshDh5xlcY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jzBUDUoUQBD0tzi9B/VXNwpoyjUIKBzxkVyikkxc/QHKpaIlgud+eCQD6psG9RUWZouQN8CQmJEY
0K5qgvfm7GxXMbjLUwnVBRg4Uzfc4OTySfJMu1k9/qGISvYwf4r0rzMMp9aPgp+ElEwTGx3z9N0A
vWNdEjCI2mqdxmP3Q9AYUPTudILppELRMP4SJijczuRIhtAKpxFjTP2gL8zQE0aq1kkWRZfaHW1t
wV7tZ/jCUxkX8uj8DL6Bei6oBC1nTm/FjPhi+htKla8XNUEftaqUre2/0Sxhsxl/FTAzaex9fCj4
AMt2l6o0FpW5JlLhGnTYhWm/bgsyGCPBg6lSjQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lzAe96+V86F1hjybjbpjtrHS9OZ9j4ztpDRe9Slm9msEm2rmGgXhgs7f+AaKRVjm3vydcWTpf/1T
glcR1WBo1nWwM9OqojgPdWLkzkmHvCkri2FdKwjWy4PqdKMYOYusjht/pshyy2t2j9sJMPK0+nc3
L1IyixFz4tEi84G+9tCKoeWm6Vd281B2ECTlZnhQUcCRp1Dx9PbPXXdmQo7evEXpwRDTe9sxQVge
cYU5UysDaIWAVkm+86NDl02K9OMQakTX19VSc4cO9xuYfz+yd985arZZwUs6/+3onQB5pMAaMVLd
qHvfYSuX3ehIRgAaM1AlWtR8QyydOkXbosGtWg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
3/WgzlQtZmNNE6+kkFwzhDma7zmlSeY7bDgHUpyLb4EgXxaBafMiYEOiYXFEA2/eL7+iUBqKwqyI
j8upesJV9dowZDo6jQVZVe7ijzheShF9tjeuHoxfHfcNAAQwjrkD3HH5oQNkKI8cf0yT/cj6kbdZ
3NFuNDB3TnILb44BUgkPRs6Pt6rjbFJMRwTMTW6jGxoUoCrGgND2z/UZJt0e4gUBMYKsjh1zaOgK
u0/yf7hUKQQ4QW3GgjgqavBeujMayDtQluGlr0eapLLoWYwODal05mrnqjgV12xaw9VyWnbMVl6t
BdnbArvaKNJtg+wcVPxGXnroLYsTR3Aa7xTQVQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
yeJWG4KqWr3tfk2Pi6YDbXNV/44590Bpiw==
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
