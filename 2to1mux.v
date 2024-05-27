module gatelevel (a,b,s,y);
input a,b,s;
output y;
wire sbar,w1,w2;

not g1(sbar,s);
and g2(w1,a,sbar);
and g3(w2,s,b);
or g4(y,w1,w2);

endmodule
module gatelevel_tb;
reg a,b,s;
wire y;
gatelevel i(a,b,s,y);
initial 
begin
    s=1'b0 ; a=1'b0 ; b=1'b0;
    $monitor("time:%f, s=%b, a=%b, b=%b, y=%b",$time, s,a,b,y);
    #5 s=1'b0; a=1'b1; b=1'b0; 
    #5 s=1'b0; a=1'b0; b=1'b1;
    #5 s=1'b1; a=1'b1; b=1'b0;
    #5 s=1'b1; a=1'b0; b=1'b1;
end
endmodule
