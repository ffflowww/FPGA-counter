module extra_registers(
    input logic i_clk,
    input logic [6:0] i_HEXs[4:0],
    input logic [4:0] i_LEDs,
    
    output logic [6:0] o_HEXs[4:0],
    output logic [4:0] o_LEDs
);

always_ff @(posedge i_clk) begin
    o_LEDs <= i_LEDs; // shows data on LEDs
    o_HEXs <= i_HEXs; // shows data on 7-segment displays
end
endmodule
