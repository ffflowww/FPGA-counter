module led_decoder(
    input logic i_clk,
    input logic i_reset,
    input logic [4:0] i_data,
    
    output logic [4:0] o_LEDs
);

always_ff @(posedge i_clk, negedge i_reset) begin
    if (~i_reset) o_LEDs <= 0;
    else o_LEDs <= i_data;
end
endmodule
