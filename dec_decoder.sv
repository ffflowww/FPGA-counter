module dec_decoder(
    input logic [4:0] i_data,
    
    output logic [6:0] o_dec_HEXs[4:0]
);

// local parameters for 7-segment display
localparam num0 = 7'b 1000000;
localparam num1 = 7'b 1111001;
localparam num2 = 7'b 0100100;
localparam num3 = 7'b 0110000;
localparam num4 = 7'b 0011001;
localparam num5 = 7'b 0010010;
localparam num6 = 7'b 0000010;
localparam num7 = 7'b 1111000;
localparam num8 = 7'b 0000000;
localparam num9 = 7'b 0010000;
localparam numOff = 7'b 1111111;

// turn off unnecessary displays
assign o_dec_HEXs[2] = numOff;
assign o_dec_HEXs[1] = numOff;
assign o_dec_HEXs[0] = numOff;

always_ff @(i_data) begin
    case (i_data / 10)
        0: o_dec_HEXs[4] <= num0;
        1: o_dec_HEXs[4] <= num1;
        2: o_dec_HEXs[4] <= num2;
        3: o_dec_HEXs[4] <= num3;
        4: o_dec_HEXs[4] <= num4;
        5: o_dec_HEXs[4] <= num5;
        6: o_dec_HEXs[4] <= num6;
        7: o_dec_HEXs[4] <= num7;
        8: o_dec_HEXs[4] <= num8;
        9: o_dec_HEXs[4] <= num9;
        default: o_dec_HEXs[4] <= numOff;
    endcase
    case (i_data % 10)
        0: o_dec_HEXs[3] <= num0;
        1: o_dec_HEXs[3] <= num1;
        2: o_dec_HEXs[3] <= num2;
        3: o_dec_HEXs[3] <= num3;
        4: o_dec_HEXs[3] <= num4;
        5: o_dec_HEXs[3] <= num5;
        6: o_dec_HEXs[3] <= num6;
        7: o_dec_HEXs[3] <= num7;
        8: o_dec_HEXs[3] <= num8;
        9: o_dec_HEXs[3] <= num9;
        default: o_dec_HEXs[3] <= numOff;
    endcase
end
endmodule
