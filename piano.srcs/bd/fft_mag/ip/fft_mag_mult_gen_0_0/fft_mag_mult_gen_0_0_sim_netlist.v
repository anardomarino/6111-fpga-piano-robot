// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Nov  1 15:59:34 2019
// Host        : Sarah-HP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Sarah/Documents/6.111TA/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_mult_gen_0_0/fft_mag_mult_gen_0_0_sim_netlist.v
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
o7XyiKAkF95j4npqhTmS1PzOA382t3MUj1wqOLYW70Xenz05wEr0x7mY69heY6hINS1s1RQlX1+h
m+mgiANrqx39oP6bZfncCoCyJSPAGaGhfK3+GWTQl7isiebHbv8hYXlqG1aVKAv1BqY9nXBZ8oxS
hWJV6IrpZZEzERQrofwamUI88O/2iHDyDEgJ64csoqoXSUsZsJW8LfA/KOEZldM1TWFmu8Otln9z
6398RzNiIiebahygxkW8XJ/vbQBhEduU3FVE6BXQPybyiS8AJ4tDfk+Tkf6E1G+ZbzyjdEatga+O
BUqgXINHV6kwMlXhaoPYC6+antX4cCfD1hAexg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ZkQJ4zDgb5aFqx723nitAAul7aVMMwlrxSWJVcJ+LLoyMX76YN4O8MCifg6nrwQatLjNkvKn5tfC
4Q4tmS0eQV/QAlwhjIZyhwCodaK8aBP79p8MinIdnYsTqqLnaZzXrsnSf/QDJj0D483CxiglQoJo
I9VejxWxEGhGmBXTIoJ+aZpoi8tBB52xAb/FTzIAkNjiO0QcEt2H5lvyXWClNi2ieii0VdtG/opr
/Eo3/O5esKwd6TRHequF6aVDby0EmBzAcS8DJv5FiyIrydTXaXhfdB4FCHsHqZmp1vTK5vxoQfB0
L/VVZ51QIBItSYOebTbgGPzErwUWWCse4L83hw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7264)
`pragma protect data_block
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
TM9vZIJCcZ+41Wlc4pBIfINR1d5ZH8ZHKA==
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
