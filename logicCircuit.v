module logCircuitGateLevel ( a, b, cin, s, cout);
input a, b, cin;
output s, cout;
wire w1, w2, w3;

xor x1(w1, a, b);
xor x2(s, w1, cin);

and a1(w2, w1, cin);
and a2(w3, a, b);
or o1(cout, w2, w3);
    
endmodule

module logCircuitTestBench;
reg a,b,cin;
wire s, cout;

logCircuitGateLevel i(a,b,cin,s,cout);

initial begin
    a=1'b0;
    b=1'b0;
    cin=1'b0;

    $monitor("Time: %0t, a=%b, b=%b, cin=%b, s=%b, cout=%b", $time, a, b, cin, s, cout);
    #5 a=1'b0; b=1'b0; cin=1'b0;
    #5 a=1'b0; b=1'b0; cin=1'b1;
    #5 a=1'b0; b=1'b1; cin=1'b0;
    #5 a=1'b0; b=1'b1; cin=1'b1;
    #5 a=1'b1; b=1'b0; cin=1'b0;
    #5 a=1'b1; b=1'b0; cin=1'b1;
    #5 a=1'b1; b=1'b1; cin=1'b0;
    #5 a=1'b1; b=1'b1; cin=1'b1;

end
endmodule