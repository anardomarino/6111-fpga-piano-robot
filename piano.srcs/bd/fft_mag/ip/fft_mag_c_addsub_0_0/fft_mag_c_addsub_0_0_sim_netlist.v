// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Nov  1 16:00:15 2019
// Host        : Sarah-HP running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Sarah/Documents/6.111TA/Nexys4FFTDemo-master/src/bd/fft_mag/ip/fft_mag_c_addsub_0_0/fft_mag_c_addsub_0_0_sim_netlist.v
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
G+LLXtme9tYTE9FRO3LZjsX58EMMt1hDl/bdK/ntXeWJjWmu/3Lbc1U0BmWsNlN2kl8P0PsbOy1M
mc796WPxKX336GREyhWn3VpHPpLUk7RKWnO6Q1GI/1S9WtndusmMXqwjvJKC+XtZenf6A6q3XQu8
rmRJq0zJ47vhlwA3/baj7LfGBlTBz2hg1+uMiDW9MLFhsYdcFV2u/wPBQYu+7/IREr36svoLKlsK
2APWHfmj+ZN8WVVdrv9Uddiq+nVAJ3pxILPrK6AWcyqhp62S954un/80WTNmpqrMTj6fQKCQF960
FLIK3NARdsXny80v07h6y0+m4VY3V7t7YGS7rw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Tw7UaTdMwLTkTbgCGf8+fhzwPj9EUQyoE2b0KGgVL76wUyQHngqipfBAsFVQFLAj3Df+2oEmRRFe
hdvIGj51UF+hRARgGESnDO7cv9s0mfFyQmFOXjNi0BnzxsLVMHmZNNIUvz7UgPrD1h/phUp+ZEoO
YBYQG80mBRtyTNZQ60Uc88rn57T5+PKBjjzXSBPfy96CDQ/eWJTicx37UMrnz8D4KLdV6z8wYO3d
vn8zttC26smgFSL3xs97wpdRNOAx/LrwRZ8xGesV2UKL9KtM3TwyEM2wnjH91siIbmQN3VR2Ezl1
U8ymmqGdPszbg4isRAIzvMYHkUG7U397lEY1hg==

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
