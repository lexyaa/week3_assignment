// ------------------------------------------------
// Assignment01_SR Latch based DFF Design
// ------------------------------------------------
module dff_sr(  q,
                nq,
                d,
                clk );

output q             ;
output nq            ;

input  d             ;
input  clk           ;

// --------------------
// Master D Flip-flop
// --------------------
wire   nd            ;           //meaning not d
wire   nclk          ;           //meaning not clk
not    not_u0(nd, d)             ;
not    not_u1(nclk, clk)         ;

wire   node1         ;
wire   node2         ;
nand   nand_u0(node1, d, clk)    ;
nand   nand_u1(node2, nd, clk)   ;

wire   s            ;            //S
wire   r            ;            //R
nand   nand_u2(s, node1, r)      ;
nand   nand_u3(r, node2, s)      ;

// --------------------
// Slave SR Flip-flop
// --------------------
wire   node3        ;
wire   node4        ;
nand   nand_u4(node3, s, nclk)   ;
nand   nand_u5(node4, r, nclk)   ;

nand   nand_u6(q, node3, nq)     ;
nand   nand_u7(nq, node4, q)     ;

endmodule
