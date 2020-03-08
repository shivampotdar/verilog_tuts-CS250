module XOR_GATE_S(y,a,b);
//Structural

    //I/O POrt
    input a,b;
    output y;
    
    //2 local wires
    wire w1,w2;
    
    // with keyword it is simply
    //xor(y,a,b);
    
    //without keyword - declare wires, 2 AND + 1 OR Gates
    and(w1,a,~b);
    and(w2,~a,b);
    or(y,w1,w2);
    
endmodule    
