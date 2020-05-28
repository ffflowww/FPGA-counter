module led_decoder(
    input logic [4:0] i_data,
    
    output logic [4:0] o_LEDs
);

assign o_LEDs = i_data;  // shows data on LEDs

endmodule
