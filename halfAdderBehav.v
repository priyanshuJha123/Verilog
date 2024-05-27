module halfAdderBehav (
    a, b, sum, carry
);
input a, b;
output sum, carry;
reg sum, carry;

always @(a or b or sum or carry) begin
    if(a==1'b1 && b==1'b1)
        carry = 1'b1;
    else
        carry = 1'b0;
    if(a==1'b1 ^ b==1'b1)
        sum = 1'b1;
    else
        sum = 1'b0;
end
    
endmodule

module halfAdderBehavTestBench;
reg a, b;
wire sum, carry;
halfAdderBehav i(a, b, sum, carry);

initial begin
    a=1'b0;
    b=1'b0;
  
    $monitor("Time: %0t a=%b b=%b sum=%b carry=%b", $time, a, b, sum, carry);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;
end
endmodule`