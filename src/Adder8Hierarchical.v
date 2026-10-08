//==============================================================================
// 8-bit Hierarchical Adder Module
//==============================================================================

module Adder8Hierarchical(
	input  [7:0] a,  // Operand A
	input  [7:0] b,  // Operand B
	input        ci, // Carry-In
	output [7:0] s,  // Sum
	output       co  // Carry-Out
);

	// Declare any internal wires you want to use here.
	wire carryo [6:0];

	// Write your code here. Instantiate eight FullAdder modules
	// and connect them to the inputs and outputs appropriately.
	FullAdder adder1(
	.a(a[0]),
	.b(b[0]),
	.ci(ci),
	.s(s[0]),
	.co(carryo[0])
	);
	
	FullAdder adder2(
	.a(a[1]),
	.b(b[1]),
	.ci(carryo[0]),
	.s(s[1]),
	.co(carryo[1])
	);
	
	FullAdder adder3(
	.a(a[2]),
	.b(b[2]),
	.ci(carryo[1]),
	.s(s[2]),
	.co(carryo[2])
	);
	
	FullAdder adder4(
	.a(a[3]),
	.b(b[3]),
	.ci(carryo[2]),
	.s(s[3]),
	.co(carryo[3])
	);
	
	FullAdder adder5(
	.a(a[4]),
	.b(b[4]),
	.ci(carryo[3]),
	.s(s[4]),
	.co(carryo[4])
	);
	
	FullAdder adder6(
	.a(a[5]),
	.b(b[5]),
	.ci(carryo[4]),
	.s(s[5]),
	.co(carryo[5])
	);
	
	FullAdder adder7(
	.a(a[6]),
	.b(b[6]),
	.ci(carryo[5]),
	.s(s[6]),
	.co(carryo[6])
	);
	
	FullAdder adder8(
	.a(a[7]),
	.b(b[7]),
	.ci(carryo[6]),
	.s(s[7]),
	.co(co)
	);
	

endmodule
