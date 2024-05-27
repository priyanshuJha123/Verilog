module mux4to1 (
    s0, s1, i0, i1, i2, i3, out
);

input s0, s1, i0, i1, i2, i3;
output out;

assign out = (~s1 & ~s0 & i0) | (~s1 & s0 & i1) | (s1 & ~s0 & i2) | (s1 & s0 & i3);

    
endmodule

module muxTestBench;

reg s0, s1, i0, i1, i2, i3;
wire out;

mux4to1 i(s0, s1, i0, i1, i2, i3, out);

initial begin
    s0 = 1'b0; s1 = 1'b0; i0=1'b0; i1=1'b0; i2=1'b0; i3=1'b0;
    $monitor("Time: %0t, s0: %b, s1: %b, i0: %b, i1: %b, i2: %b, i3: %b, out: %b", $time, s0, s1, i0, i1, i2, i3, out);
    #5 s0 = 1'b0; s1 = 1'b0; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
    #5 s0 = 1'b0; s1 = 1'b0; i0 = 1'b1; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
    #5 s0 = 1'b0; s1 = 1'b1; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
    #5 s0 = 1'b0; s1 = 1'b1; i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b0;
    #5 s0 = 1'b1; s1 = 1'b0; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
    #5 s0 = 1'b1; s1 = 1'b0; i0 = 1'b0; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0;
    #5 s0 = 1'b1; s1 = 1'b1; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b0;
    #5 s0 = 1'b1; s1 = 1'b1; i0 = 1'b0; i1 = 1'b0; i2 = 1'b0; i3 = 1'b1;
end
endmodule