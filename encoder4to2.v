module encoder4to1 (
    i, y
);

input [3:0] i;
output [1:0] y;

assign y[0] = i[1] | i[3];
assign y[1] = i[2] | i[3];
    
endmodule

module encoderTestBench;

reg [3:0] i;
wire [1:0] y;

encoder4to1 p(i, y);

initial begin
    i=4'b0000;

    $monitor("Time=%f, i=%b, y=%b",$time, i, y);
    #5 i=4'b0001;
    #5 i=4'b0010;
    #5 i=4'b0100;
    #5 i=4'b1000;
end

endmodule