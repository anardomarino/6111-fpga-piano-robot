import math

# mapCreation.py
# Anthony Nardomarino
# FPGA Piano-Playing Robot
# MIT 6.111 Digital Systems Lab
#
# Generates SystemVerilog map module code for Frequency-Note reference
# as well as PWM angle conversions
#
# 11-15-2019

def generateFreqMap():
	'''
	Generates map for frequencies to piano keys given 2 seperate octaves
	5-bit address for each key, with msb representing the hand
	0 - lower octave
	1 - higher octave
	Both separations divided by C4
	e.g. 	00000 == C[0,3]
			10000 == C[4,inf]
			00001 == D[0,3]
			10001 == D[4,inf]
	Output should be an nx5 ROM where n is the amount of possible freqs
	from a keyboard (88 for a standard keyboard)
	'''

	# four_freqs is a constant baseline for generating freqs
	# stores the frequencies of C4-B4 in that order
	A4 = 440

	print('module freqKeyMap(')
	print('\tinput\t\t[12:0]\tfreqIn,')
	print('\toutput\tlogic\t[4:0]\tkeyOut')
	print(');')
	print('\tlogic\t[4:0]\tkey;')
	print('\tassign keyOut = key;')
	print('\talways_comb begin')
	print('\t\tcase(freqIn)')
	for i in range(88):
		val = math.floor(2**((48-i)/12)*A4)
		binary = bin((-i+9)%12)[2:]
		binary = (val >= 261)*'1' + (val < 261)*'0' + (4-len(binary))*'0' + binary
		print('\t\t\t13\'d' + str(val) + ': ', end = '\t')
		print('5\'b' + binary + ';')
	print('\t\tendcase')
	print('\tend')
	print('endmodule')


def generatePWMMap():
	pass

if __name__ == '__main__':
	generateFreqMap()