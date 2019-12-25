// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Nov  1 15:59:32 2019
// Host        : Sarah-HP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top fft_mag_mult_gen_1_0 -prefix
//               fft_mag_mult_gen_1_0_ fft_mag_mult_gen_0_0_sim_netlist.v
// Design      : fft_mag_mult_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fft_mag_mult_gen_0_0,mult_gen_v12_0_15,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_15,Vivado 2019.1" *) 
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
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
npRFG1+tF1vG5mrUYEnaV5eUykz3QAdteNltm1GTlndHfa4tIrsWZSqFZkLyA1Y/hklYFZ7FG/BR
30YD9R+yeLe+tdAsivrv5cmvHkHGM8FEkPgTjcfNsIWEdCCLXhxfk+agoFdwE5lk7Vnu6qag0upQ
yAe3bmF9h4/K5yxwtL+EqZ7nlHjK3Md11c2Bkqw74m4nbED6ngcTSGYGMl8lMbO+tafL46Z/1ZfW
SUW1RMcNg2GMP7r5CqlRncLMZdDJKKdCh2j+ZUPpOvLAXrC4HqPNZuhpfLHNDJ7n5WP04jRSuKiX
YLoAEwjj69UzoRl+sr7k0tGWdl2//Uq+5XlI2A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
R/VZHEUBLC4EBi4T0I7tvVePzVg1W8lzU/BWobnv9SCwTlvOKLKpJf1aMsEOjJSkh1KEHv8lkor+
QbwRnVfB7cMdFKFvDnBU5KwAdyzHW3zPGJCecpKf1F1YXp6ZcXUYMTOlLAwoWcYqTB6r7koISQ4y
fXs/p6bE4CwiWqWJvL32hDlPfxgFaaIkc6LjRDtdUEVy3wgs3LcZ4ZaZzefRNzneQgHxj2bupI9W
6nssFmHE43C6m37U/CDGQQLgxfwgaogfU7knM/G0xkkipCopiy/bVaSBkK5RFepkQGTpgIZ8PUeo
VfEdwy2shNQGRgA6eXVjeCQxS5fLu+tJFSBd/w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7248)
`pragma protect data_block
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
HaU=
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
