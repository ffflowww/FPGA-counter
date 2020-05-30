module extra_registers(
    input logic i_clk,
    input logic i_reset,
    input logic [6:0] i_HEXs[4:0],
    input logic [4:0] i_LEDs,
    
    output logic [6:0] o_HEXs[4:0],
    output logic [4:0] o_LEDs
);

always_ff @(posedge i_clk, negedge i_reset) begin
    if(~i_reset) begin
        o_LEDs <= 5'd0;
        o_HEXs <= '{5{7'd0}};
    end else begin
        o_LEDs <= i_LEDs; // shows data on LEDs
        o_HEXs <= i_HEXs; // shows data on 7-segment displays
    end
end
endmodule
