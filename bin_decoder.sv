module bin_decoder(
    input logic i_clk,
    input logic i_reset,
    input logic [4:0] i_data,
    
    output logic [6:0] o_bin_HEXs[4:0]
);

localparam NUM_0 = 7'b 1000000;
localparam NUM_1 = 7'b 1111001;

always_ff @(posedge i_clk, negedge i_reset) begin
    if (~i_reset) o_bin_HEXs <= '{5{7'd0}};
    else begin
        o_bin_HEXs[4] <= i_data[4] ? NUM_1 : NUM_0;  // HEX4
        o_bin_HEXs[3] <= i_data[3] ? NUM_1 : NUM_0;  // HEX3
        o_bin_HEXs[2] <= i_data[2] ? NUM_1 : NUM_0;  // HEX2
        o_bin_HEXs[1] <= i_data[1] ? NUM_1 : NUM_0;  // HEX1
        o_bin_HEXs[0] <= i_data[0] ? NUM_1 : NUM_0;  // HEX0
    end
end
endmodule
