// FA

module TB_FA();
    
    // local reg
    reg a,b,carry_in;
    wire sum,carry_out;
    
    //DUT
    FA_always fa_dut(sum,carry_out,a,b,carry_in);
    
    initial
    begin
        
        $monitor($time,".a : %b b: %b carry_in : %b sum : %b carry_out : %b",a,b,carry_in,sum,carry_out);
        
        $dumpfile("fa.vcd");
        $dumpvars(0,TB_FA);
        
           a=0;b=0;carry_in=0;
        #5 a=0;b=0;carry_in=1;
        #5 a=0;b=1;carry_in=0;
        #5 a=0;b=1;carry_in=1;
        #5 a=1;b=0;carry_in=0;
        #5 a=1;b=0;carry_in=1;
        #5 a=1;b=1;carry_in=0;
        #5 a=1;b=1;carry_in=1;
        
        #10 $finish;
        
    end
    
endmodule
