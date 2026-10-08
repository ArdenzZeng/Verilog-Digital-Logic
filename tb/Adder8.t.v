//==============================================================================
// Test Unit for 8-bit Adders
//==============================================================================

module Adder8Test;

	// IO Vars for Hierarchical Adder
	reg  [7:0] ah, bh;
	reg        cih;
	wire [7:0] sh;
	wire       coh;

	// IO Vars for Procedural Adder
	reg  [7:0] ap, bp;
	reg        cip;
	wire [7:0] sp;
	wire       cop;

	// Number of Errors
	reg [7:0] h_errors = 0;
	reg [7:0] p_errors = 0;

	// Hierarchical Adder Module
	Adder8Hierarchical adderh(
		.a (ah),
		.b (bh),
		.ci(cih),
		.s (sh),
		.co(coh)
	);

	// Procedural Adder Module
	Adder8Procedural adderp(
		.a (ap),
		.b (bp),
		.ci(cip),
		.s (sp),
		.co(cop)
	);

	// Main Test Logic
	initial begin
		$display("\nBeginning Tests");
		$display("========================");

		//==================================
		// Test Cases
		//==================================
		// |  a  |  b  |  ci  =>  s  |  co |

		// Test Case 0
		// |  10 |  15 |  1   =>  26 |  0  |
		ah  = 8'd10; ap  = 8'd10;
		bh  = 8'd15; bp  = 8'd15;
		cih = 1'd1;  cip = 1'd1;
		/* verilator lint_off STMTDLY */
		#5;
		/* verilator lint_on STMTDLY */
		if (sh !== 8'd26 || coh !== 1'd0) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd26, 1'd0);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd26 || cop !== 1'd0) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd26, 1'd0);
			p_errors = p_errors + 1;
		end

		//--------------------------
		// Add your test cases here
		//--------------------------

		// Test Case 1
		// | 0  | 0   |  0  =>   0  |  0  |
		
		ah  = 8'd0; ap  = 8'd0;
		bh  = 8'd0; bp  = 8'd0;
		cih = 1'd0;  cip = 1'd0;
		/* verilator lint_off STMTDLY */
		#5;
		/* verilator lint_on STMTDLY */
		if (sh !== 8'd0 || coh !== 1'd0) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd0, 1'd0);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd0 || cop !== 1'd0) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd0, 1'd0);
			p_errors = p_errors + 1;
		end

		// Test Case 2
		// | 0  | 0   |   1  =>  1  |  0  |
		ah  = 8'd0; ap  = 8'd0;
		bh  = 8'd0; bp  = 8'd0;
		cih = 1'd1;  cip = 1'd1;
		/* verilator lint_off STMTDLY */
		#5;
		/* verilator lint_on STMTDLY */
		if (sh !== 8'd1 || coh !== 1'd0) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd1, 1'd0);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd1 || cop !== 1'd0) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd1, 1'd0);
			p_errors = p_errors + 1;
		end

		// Test Case 3
		// | 15 |  1  |  0   =>  16 |  0  |
		ah  = 8'd15; ap  = 8'd15;
		bh  = 8'd1; bp  = 8'd1;
		cih = 1'd0;  cip = 1'd0;
		/* verilator lint_off STMTDLY */
		#5;
		/* verilator lint_on STMTDLY */
		if (sh !== 8'd16 || coh !== 1'd0) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd16, 1'd0);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd16 || cop !== 1'd0) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd16, 1'd0);
			p_errors = p_errors + 1;
		end

		// Test Case 4
		// | 255| 0  |   1   =>   0  | 1    |
		ah  = 8'd255; ap  = 8'd255;
		bh  = 8'd0; bp  = 8'd0;
		cih = 1'd1;  cip = 1'd1;
		/* verilator lint_off STMTDLY */
		#5;
		/* verilator lint_on STMTDLY */
		if (sh !== 8'd0 || coh !== 1'd1) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd0, 1'd1);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd0 || cop !== 1'd1) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd0, 1'd1);
			p_errors = p_errors + 1;
		end

		// Test Case 5
		// |  255  | 255    |  1    => 255    |  1   |
		ah  = 8'd255; ap  = 8'd255;
		bh  = 8'd255; bp  = 8'd255;
		cih = 1'd1;  cip = 1'd1;
		/* verilator lint_off STMTDLY */
		#5;
		/* verilator lint_on STMTDLY */
		if (sh !== 8'd255 || coh !== 1'd1) begin
			$display("\nHierarchical Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
			         ah, bh, cih, sh, coh);
			$display("\tExpected => S(%d) + CO(%h)", 8'd255, 1'd1);
			h_errors = h_errors + 1;
		end
		if (sp !== 8'd255 || cop !== 1'd1) begin
			$display("\nProcedural Adder Failure!");
			$display("\tA(%d) + B(%d) + CI(%h) => S(%d) + CO(%h)",
				 ap, bp, cip, sp, cop);
			$display("\tExpected => S(%d) + CO(%h)", 8'd255, 1'd1);
			p_errors = p_errors + 1;
		end

		//--------------------------
		// Print Final Summary
		//--------------------------
		$display("\nTests Completed. %d Hierarchical Failures, %d Procedural Failures\n",
		         h_errors, p_errors);
		$display("========================");
		$finish;
	end

endmodule


