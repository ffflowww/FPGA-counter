module extra_registers(
    input logic [6:0] i_HEXs[4:0],
    input logic [4:0] i_LEDs,
    
    output logic [6:0] o_HEXs[4:0],
    output logic [4:0] o_LEDs
);

logic [6:0] reg_HEXs[4:0];
logic [4:0] reg_LEDs;

// inputs
assign reg_HEXs = i_HEXs;
assign reg_LEDs = i_LEDs;

// outputs
assign o_HEXs = reg_HEXs;
assign o_LEDs = reg_LEDs;

endmodule
