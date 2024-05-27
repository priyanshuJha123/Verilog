module and_gate(a,b,d,bu);
input a,b;
output d,bu;
reg d,bu;


always@ (a or b or d or bu)
begin
    if((a==1'b0 && b==1'b0) || (a==1'b1 && b==1'b1))
       d=1'b0;
       else 
       d=1'b1;
    if(a==1'b0 && b==1'b1)
      bu=1'b1;
      else 
      bu=1'b0;     
end
endmodule

module test;
reg a,b;
wire d,bu;


and_gate t1(a,b,d,bu);
initial
begin
    a=1'b0;
    b=1'b0;
    $monitor("time:%0t a=%b , b=%b ,d=%b, bu=%b",$time ,a,b,d,bu);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;
end 
endmodule


