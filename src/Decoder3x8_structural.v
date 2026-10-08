module Decoder3x8(
  input [2:0] i,
  output [7:0] d
);

  // INSERT LOGIC HERE
  wire [7:0] d;
 // assign d = 0;
  assign d[0] = ~i[2] && ~i[1] && ~i[0]; // 000
  //assign d = 0;
  assign d[1] = ~i[2] && ~i[1] && i[0]; // 001
 // assign d = 0;
  assign d[2] = ~i[2] && i[1] && ~i[0]; // 010
 // assign d = 0;
  assign d[3] = i[2] && ~i[1] && ~i[0]; // 100
 // assign d = 0;
  assign d[4] = ~i[2] && i[1] && i[0]; // 011
 // assign d = 0;
  assign d[5] = i[2] && ~i[1] && i[0]; // 101
 // assign d = 0;
  assign d[6] = i[2] && i[1] && ~i[0]; // 110
 // assign d = 0;
  assign d[7] = i[2] && i[1] && i[0]; // 111

endmodule
