module four(s1,s2,d,y0,y1,y2,y3);
input s1,s2,d;
output y0,y1,y2,y3;
wire sb1,sb2;

assign sb1=~s1;
assign sb2=~s2;

assign y0=sb1 & sb2 & d;
assign y1=sb1 & s2 & d;
assign y2=s1 & sb2 & d;
assign y3=s1 & s2 & d;

endmodule

module test;
reg s1,s2,d;
wire y0,y1,y2,y3;

four i(s1,s2,d,y0,y1,y2,y3);
initial
begin
    s1=1'b0; s2=1'b0; d=1'b0;
    $monitor("time=%0t s1=%b s2=%b d=%b y3=%b y2=%b y1=%b y0=%b", $time, s1,s2,d,y3,y2,y1,y0 );
    #5 s1=1'b0; s2=1'b0; d=1'b0;
    #5 s1=1'b0; s2=1'b0; d=1'b1;
    #5 s1=1'b0; s2=1'b1; d=1'b0;
    #5 s1=1'b0; s2=1'b1; d=1'b1;
    #5 s1=1'b1; s2=1'b0; d=1'b0;
    #5 s1=1'b1; s2=1'b0; d=1'b1;
    #5 s1=1'b1; s2=1'b1; d=1'b0;
    #5 s1=1'b1; s2=1'b1; d=1'b1;
end 
endmodule
    

