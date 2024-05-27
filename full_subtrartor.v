module fulladder(a,b,c,diff,borrow);
input a,b,c;
output diff,borrow;
reg diff,borrow;

always@(a,b,c,diff,borrow)
begin

    if (a==1'b0)
    begin
        if((b==1'b0 && c==1'b0) || (b==1'b1 && c==1'b1))
        diff=1'b0;
        else
        diff=1'b1;
    end
    else
    begin

         if((b==1'b0 && c==1'b0) || (b==1'b1 && c==1'b1))
         diff=1'b1;
         else
         diff=1'b0;

    end

    if(a==1'b0)
    begin
        if(b==1'b0 && c==1'b0)
        borrow=1'b0;
        else
        borrow=1'b1;
    end
    else
    begin
        if(b==1'b1 && c==1'b1)
        borrow=1'b1;
        else
        borrow=1'b0;
    end


end
endmodule


module test;
reg a,b,c;
wire diff,borrow;


fulladder t1(a,b,c,diff,borrow);
initial
begin
    a=1'b0;
     b=1'b0;
      c=1'b0;
   $monitor("time=%0t a=%b ,b=%b ,c=%b ,diff=%b ,borrow=%b",$time,a,b,c,diff,borrow);
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
