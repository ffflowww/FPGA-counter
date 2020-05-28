module bin_decoder(
    input logic [4:0] i_data,
    
    output logic [6:0] o_bin_HEXs[4:0]
);

localparam num0 = 7'b 1000000;
localparam num1 = 7'b 1111001;

always_ff @(i_data) begin
    o_bin_HEXs[4] <= i_data[4] ? num1 : num0;  // HEX4
    o_bin_HEXs[3] <= i_data[3] ? num1 : num0;  // HEX3
    o_bin_HEXs[2] <= i_data[2] ? num1 : num0;  // HEX2
    o_bin_HEXs[1] <= i_data[1] ? num1 : num0;  // HEX1
    o_bin_HEXs[0] <= i_data[0] ? num1 : num0;  // HEX0
end
endmodule
