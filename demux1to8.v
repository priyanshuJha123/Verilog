module demux1to8 (
    a, b, c, v, d0, d1, d2, d3, d4, d5, d6, d7, sum, carry
);
input a, b, c, v;
output d0, d1, d2, d3, d4, d5, d6, d7, sum, carry;

assign d0 = ~b & ~c & ~v & a;
assign d1 = ~b & ~c & v & a;
assign d2 = ~b & c & ~v & a;
assign d3 = ~b & c & v & a;
assign d4 = b & ~c & ~v & a;
assign d5 = b & ~c & v & a;
assign d6 = b & c & ~v & a;
assign d7 = b & c & v & a;

// sum = d1 + d2 + d4 + d7
assign sum = d1 | d2 | d4 | d7;
// carry = d3 + d5 + d6 + d7
assign carry = d3 | d5 | d6 | d7;



    
endmodule

// module fullAdder (a, b, c, s, cOut);

module demuxTestBench;
reg a, b, c, v;
wire d0, d1, d2, d3, d4, d5, d6, d7, sum, carry;

demux1to8 i(a, b, c, v, d0, d1, d2, d3, d4, d5, d6, d7, sum, carry);

initial begin
    a=1'b1;
    b=1'b0; c=1'b0; v=1'b0;
    $monitor("Time: %0t, b: %b, c: %b, v: %b, a: %b, d0: %b, d1: %b, d2: %b, d3: %b, d4: %b, d5: %b, d6: %b, d7: %b, sum: %b, carry: %b", $time, b, c, v, a, d0, d1, d2, d3, d4, d5, d6, d7, sum, carry);
    #5 b=1'b0; c=1'b0; v=1'b0;
    #5 b=1'b0; c=1'b0; v=1'b1;
    #5 b=1'b0; c=1'b1; v=1'b0;
    #5 b=1'b0; c=1'b1; v=1'b1;
    #5 b=1'b1; c=1'b0; v=1'b0;
    #5 b=1'b1; c=1'b0; v=1'b1;
    #5 b=1'b1; c=1'b1; v=1'b0;
    #5 b=1'b1; c=1'b1; v=1'b1;
end
endmodule



