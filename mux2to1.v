module mux2to1 (
    a, b, sel, out
);

input a, b, sel;
output out;
reg out;

always @(a or b or sel) begin
    
    if (sel == 1) 
        out = a;
    else 
        out = b;
    
end
    
endmodule

module muxTestBench;

reg a, b, sel;
wire out;

mux2to1 i(a, b, sel, out);

initial begin
    a = 1'b0; b = 1'b0; sel = 1'b0;
    $monitor("Time: %0t, sel: %b, a: %b, b: %b, out: %b", $time, sel, a, b, out);
    #5 sel = 1'b0; a = 1'b0; b = 1'b0;
    #5 sel = 1'b0; a = 1'b0; b = 1'b1;
    #5 sel = 1'b0; a = 1'b1; b = 1'b0;
    #5 sel = 1'b0; a = 1'b1; b = 1'b1;
    #5 sel = 1'b1; a = 1'b0; b = 1'b0;
    #5 sel = 1'b1; a = 1'b0; b = 1'b1;
    #5 sel = 1'b1; a = 1'b1; b = 1'b0;
    #5 sel = 1'b1; a = 1'b1; b = 1'b1;
end
endmodule