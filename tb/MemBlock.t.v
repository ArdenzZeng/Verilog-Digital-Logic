//==============================================================================
// Testbench for Memory Block
//==============================================================================

module MemBlock_test;

  // Local variables
  reg a, b;
  wire f, g;

  // MemBlock module
  MemBlock mem(
    .x(a),
    .y(b),
    .q(f),
    .nq(g)
  );

  // Main test
  initial begin
    a = 0;
    b = 0;
    #1
    
    b = 1;
    #1

    // Add more test cases here to simulate your MemBlock implementation
   
    // Initialize both 00
    a = 0;
    b = 0;
    #1
    
    // Rising edge on x
    a = 1;
    #1
    
    // y high x high
    b = 1;
    #1
    
    // y low x high
    b = 0;
    #1
    
    // y low x low
    a = 0;
    #1
    
    // y high x low
    b = 1;
    #1
    
    // y high x high
    a = 1;
    #1
    
    // y low x high
    b = 0;
    #1
    
    // x low
    a = 0;
    #1
    
    // x high
    a = 1;
    #1
    
    $finish;
  end

endmodule
