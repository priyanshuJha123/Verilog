module halfadder_g1 (a,b,sum,carry);
input a, b;
output sum, carry;
and g1(carry,a,b);
xor g2(sum,a,b);
endmodule
module halfadder_g1_tb;
reg a,b;
wire sum, carry;
halfadder_g1 i(a,b,sum,carry);
initial
begin
    a=1'b0;
    b=1'b0;
    $monitor("time:%0t a=%b b=%b sum=%b carry=%b",$time,a,b,sum,carry);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;
end
endmodule