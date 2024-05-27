module and_4(a,b,c,d,res);
input a,b,c,d;
output res;
wire res;


or g1(res ,a,b,c,d);
endmodule

module and1_tb;
reg a, b,c,d;
wire res;
and_4 i(a, b, c,d,res);
initial
begin
a=1'b0;
b=1'b0;
c=1'b0;
d=1'b0;
$monitor("Time:%0t a=%b b=%b c=%b d=%b res=%b",$time, a, b, c,d,res);
#5 a=1'b1; b=1'b1;c=1'b1;d=1'b1;
#5 a=1'b0; b=1'b1;c=1'b1;d=1'b0;
#5 a=1'b1; b=1'b0;c=1'b0;d=1'b0;
#5 a=1'b1; b=1'b1;c=1'b1;d=1'b1;
end
endmodule
