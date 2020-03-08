module XOR_GATE_B(y,a,b);
// Behavioral

    input a,b;
    output y;
    
    assign y = (~a & b) | (a & ~b);
endmodule    
