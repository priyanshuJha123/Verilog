module fulladder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
reg sum,carry;

always@(a,b,c,sum,carry)
begin

    if (a==1'b0)
    begin
        if((b==1'b0 && c==1'b0) || (b==1'b1 && c==1'b1))
        sum=1'b0;
        else
        sum=1'b1;
    end
    else
    begin

         if((b==1'b0 && c==1'b0) || (b==1'b1 && c==1'b1))
         sum=1'b1;
         else
         sum=1'b0;

    end

    if(a==1'b0)
    begin
        if(b==1'b1 && c==1'b1)
        carry=1'b1;
        else
        carry=1'b0;
    end
    else
    begin
        if(b==1'b0 && c==1'b0)
        carry=1'b0;
        else
        carry=1'b1;
    end


end
endmodule


module test;
reg a,b,c;
wire sum,carry;


fulladder t1(a,b,c,sum,carry);
initial
begin
    a=1'b0;
     b=1'b0;
      c=1'b0;
   $monitor("time=%0t a=%b ,b=%b ,c=%b ,sum=%b ,carry=%b",$time,a,b,c,sum,carry);
   #5 a=1'b0; b=1'b0; c=1'b0;
   #5 a=1'b0; b=1'b0; c=1'b1;
   #5 a=1'b0; b=1'b1; c=1'b0;
   #5 a=1'b0; b=1'b1; c=1'b1;
   #5 a=1'b1; b=1'b0; c=1'b0;
   #5 a=1'b1; b=1'b0; c=1'b1;
   #5 a=1'b1; b=1'b1; c=1'b0;
   #5 a=1'b1; b=1'b1; c=1'b1;
end
endmodule   
