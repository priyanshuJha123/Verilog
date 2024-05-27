module andg1(a,b,c);
input a,b;
output c;
 
anda1(c,a,b);
endmodule
module andg1tb;
reg a,b;
wire c;
initial
begin
   a=1'b0;
   b=1'b0;
   $monitor("time:%0t a=%b b=%b c=%b",$time,a,b,c);
   #5 a=1'b0; b=1'b0;
   #5 a=1'b0; b=1'b1;
   #5 a=1'b1; b=1'b0;
   #5 a=1'b1; b=1'b1;
end
endmodule