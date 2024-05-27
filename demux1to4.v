module demux1to4 (
    s1, s0, a, y0, y1, y2, y3
);
input a,s1, s0;
output y0, y1, y2, y3;

assign y0 = ~s1 & ~s0 & a;
assign y1 = ~s1 & s0 & a;
assign y2 = s1 & ~s0 & a;
assign y3 = s1 & s0 & a;
    
endmodule

module demuxTestBench;
reg s1, s0, a;
wire y0, y1, y2, y3;

demux1to4 i(s1, s0, a, y0, y1, y2, y3);

initial begin
    a=1'b1;
    s1=1'b0; s0=1'b0;
    $monitor("Time: %0t, s1: %b, s0: %b, a: %b, y0: %b, y1: %b, y2: %b, y3: %b", $time, s1, s0, a, y0, y1, y2, y3);
    #5 s1=1'b0; s0=1'b0;
    #5 s1=1'b0; s0=1'b1;
    #5 s1=1'b1; s0=1'b0;
    #5 s1=1'b1; s0=1'b1;
end
endmodule