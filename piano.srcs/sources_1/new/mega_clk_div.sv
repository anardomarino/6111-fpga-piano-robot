module mega_clk_div(
    clk_in,
    clk_out);
    
    logic [24:0] mid = 0;
    
    input logic clk_in;
    output logic clk_out;
    
    assign clk_out = mid[24];
    
    always_ff @(posedge clk_in) begin
        mid <= mid + 1;
    end
    
endmodule