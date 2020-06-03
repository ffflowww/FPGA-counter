module multiplexer(
    input logic [6:0] i_bin_HEXs[4:0],
    input logic [6:0] i_dec_HEXs[4:0],
    input logic [4:0] i_LEDs,
    input logic i_type,  // port: signal HIGH - DEC, otherwise - BIN 
    
    output logic [6:0] o_HEXs[4:0],
    output logic [4:0] o_LEDs
);

assign o_HEXs = i_type ? i_dec_HEXs : i_bin_HEXs;
assign o_LEDs = i_LEDs;

endmodule
