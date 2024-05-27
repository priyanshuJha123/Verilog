module encoder4to2_dl(i0,
i1, i2, i3, y0, y1);
input i0, i1, i2, i3;
output y0, y1;
assign y0 = i1|i3;
assign y1 = i2|i3;
endmodule
module encoder4to2_dl_tb;
reg i0, i1, i2, i3;
wire y0, y1;
encoder4to2_dl e1(i0, i1, i2, i3,
y0, y1);
initial
begin
i0=1'b0; i1=1'b0; i2=1'b0;
i3=1'b0;
$monitor("Time:%f, i0=%b i1=%b
i2=%b i3=%b, y0=%b, y1=%b",
$time,i0, i1, i2, i3, y0, y1 );
#5 i0=1'b0; i1=1'b0; i2=1'b0;
i3=1'b0;
#5 i0=1'b1; i1=1'b0; i2=1'b0;
i3=1'b0;
#5 i0=1'b0; i1=1'b1; i2=1'b0;
i3=1'b0;
#5 i0=1'b0; i1=1'b0; i2=1'b1;
i3=1'b0;
#5 i0=1'b0; i1=1'b0; i2=1'b0;
i3=1'b1;
end
endmodule