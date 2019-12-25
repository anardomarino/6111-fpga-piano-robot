// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.2 (lin64) Build 2615518 Fri Aug  9 15:53:29 MDT 2019
// Date        : Mon Dec  2 14:00:59 2019
// Host        : eecs-digital-32 running 64-bit Ubuntu 14.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /afs/athena.mit.edu/user/a/n/anthonyn/6111-piano-playing-robot/piano.srcs/sources_1/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_sim_netlist.v
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_15,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module fft_mag_mult_gen_0_0
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_15 U0
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
module fft_mag_mult_gen_0_0_mult_gen_v12_0_15
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
  fft_mag_mult_gen_0_0_mult_gen_v12_0_15_viv i_mult
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
PrCMa2GciAl4DFTm5Dade9s+TvwW8XoyznH+R0Am9utioxRc/hWx0vWtDfIf/RMAo2tmk9svcPEK
7f4PtL1HIuDn6uxE0xo3QnLPfEukdffAeJX0MUQFGSC5NsO4igJagdQM66O8HUBTLiCmEvAa/9Jp
EqMAEhdkSGqBQ3McYlNrppPA2dkjh53NQnpiyS7IZniSK/+HM6LNuNPuJeTaEdcNQubrOkCVH2Mo
DLkkRZVTf1cFbX1gJrLDaLaec3FqkgEHMupi5zwsSK39g4ljQqYhLfX8lUqnx6LoBluhapbNX5IF
Kog/t9wpb3csf0VFz7C8c8Ai0Pu86l02wek6zQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qgBVj22SCT2JUh/g+Kig6etJtJwB4fesp+TY7sHK85R4CawtedN3sphTGXlEJ4oScT3pvp2XWl00
JmstRFjmhkYC5DXzVdsjmt2Tkalo+PxkKvx+IT+dJIqRFcB0bc8VMylwNB2nPu6Kuie8kXuv6yXK
0khhf4VvKfkRwyLYIo1r7bwvOGp02kVmdAc1on4PK5zLtUvoW+lImIOsRgPrq7Z29pc4chbkubr0
OrAryEFPkSgJq7cfgAVNroQOKb1GSvtYWByH+sx/QjBaLNVlIKrMDDankJVJcnlIf1f8Y3FsUits
RNXqJxq3Eg1eoYX8ylAWHWG138NQczVw9a9YRQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
Zy97Xxr1Y4sG8uza0wHmnAFmnEv51jEnYg==
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
