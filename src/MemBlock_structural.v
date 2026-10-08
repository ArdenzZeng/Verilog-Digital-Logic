module MemBlock(
  input x,
  input y,
  output q,
  output nq
);

  // INSERT LOGIC HERE
  // Outputs of the two left-hand latches
  wire top_q, top_nq;
  wire bottom_q, bottom_nq;
  
  // Logic for three-input NAND
  wire bottom_ns;
  assign bottom_ns = x & top_nq;
  
  // Instantiate Latch module:
  // Top left-hand side latch
  Latch toplatch(
    .ns(bottom_nq),
    .nr(x),
    .q(top_q),
    .nq(top_nq)
    );
    
  Latch bottomlatch(
    .ns(bottom_ns),
    .nr(y),
    .q(bottom_q),
    .nq(bottom_nq)
    );
    
  Latch outputlatch(
    .ns(top_nq),
    .nr(bottom_q),
    .q(q),
    .nq(nq)
    );
    
endmodule
