/* Testbench for XOR_GATE */

module TB_XOR_GATE();
    
    /* local reg to feed a,b
    inputs of the XOR gates */
    
    reg a,b;
    wire y;
    /* wires a and b of the DUT driven with
    reg a and b in the TB*/
    
    /* instantiate the DUT*/
    XOR_GATE_B xor_gate(y,a,b);
    // B can be changed to S here, no changes required
    
    /* like a function call, local stuff sent to the DUT*/
        
    /* Stimulus
    Create and feed input comb to DUT*/
    
    /* procedural statements */
    initial //execute only once
    
    begin
    
        /* monitor */
        $monitor($time, ".a: %b b: %b y: %b",a,b,y);
        
        /* generate VCD (waveform) */
        
        $dumpfile("xor_gate.vcd");
        $dumpvars(0,TB_XOR_GATE);
        
        /* starting from top level module (0) 
        dump everything in the file       */
               
        // a, b, y
        // 0  0  0
        // 0  1  1
        // 1  0  1
        // 1  1  0
        // @t = 0
        a=0; b=0;
        #5 a=0; b=1;    // # means delay
        #5 a=1; b=0;
        #5 a=1; b=1;
        
        #10 $finish;         // stops execution at this pt.
        // give time to record
    end

endmodule
