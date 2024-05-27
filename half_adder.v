module and_gate(a,b,s,c);
input a,b;
output s,c;
reg s,c;


always@ (a or b or s or c)
begin
    if((a==1'b0 && b==1'b0) || (a==1'b1 && b==1'b1))
    begin
       s=1'b0;
        if(a==1'b1 && b==1'b1)
            c=1'b1;
        else 
           c=1'b0 ;
    end
    else 
    s=1'b1;
end
endmodule

module test;
reg a,b;
wire s,c;


and_gate t1(a,b,s,c);
initial
begin
    a=1'b0;
    b=1'b0;
    $monitor("time:%0t a=%b , b=%b ,s=%b, c=%b",$time ,a,b,s,c);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;
end 
endmodule


