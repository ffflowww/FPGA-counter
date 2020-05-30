module led_decoder(
    input logic [4:0] i_data,
    
    output logic [4:0] o_LEDs
);

assign o_LEDs = i_data;  // passing data to LEDs

endmodule
