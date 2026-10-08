module Latch(
  input ns,
  input nr,
  output q,
  output nq
);

  reg q;
  reg nq;

  always @( * ) begin
    // INSERT LOGIC HERE
    case ({ns,nr})
      2'b00: begin // invalid state
        q = 1'b1;
        nq = 1'b1;
        end
      2'b01: begin // set
        q = 1'b1;
        nq = 1'b0;        
        end
      2'b10: begin // reset
        q = 1'b0;
        nq = 1'b1;
        end
      2'b11: begin // hold
        q = q;
        nq = nq;
        end
      endcase
  end

endmodule
