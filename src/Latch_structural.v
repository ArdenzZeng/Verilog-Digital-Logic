module Latch(
  input ns,
  input nr,
  output q,
  output nq
);

  // INSERT LOGIC HERE
  assign q = ~(ns & nq);
  assign nq = ~(nr & q);

endmodule
