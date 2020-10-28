module a1;

parameter     N = 10       ;

wire          q            ;
wire          nq           ;

reg           d            ;
reg           clk          ;

initial       clk = 1'b0   ;
initial       d = 1'b0     ;
always #(2*N)  clk = ~clk  ;

// -----------------
// Instances
// -----------------
dff_sr        uo( .q    (  q    ),
                  .nq   (  nq   ),
                  .d    (  d    ),
                  .clk  (  clk  ));

// -----------------
// Stimulus
// -----------------
initial begin
#(N)    d = 1'b1           ;     #(N)    $display(" clk = %b, D = %b, Q = %b", clk, d, q);
#(N)    d = 1'b0           ;     #(N)    $display(" clk = %b, D = %b, Q = %b", clk, d, q);
#(N)    d = 1'b1           ;     #(N)    $display(" clk = %b, D = %b, Q = %b", clk, d, q);
#(N)    d = 1'b1           ;     #(N)    $display(" clk = %b, D = %b, Q = %b", clk, d, q);
#(N)    d = 1'b0           ;     #(N)    $display(" clk = %b, D = %b, Q = %b", clk, d, q);
$finish;
end

endmodule
