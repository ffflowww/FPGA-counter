module rsp (
    input logic [4:0] i_data,   // port(bus): incoming data
    input logic i_type,  // port: signal HIGH - DEC, otherwise - BIN 

    // Seven-segment displays
    output logic [6:0] o_HEX0,
    output logic [6:0] o_HEX1,
    output logic [6:0] o_HEX2,
    output logic [6:0] o_HEX3,
    output logic [6:0] o_HEX4,
    output logic [4:0] o_LEDS
);
    
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
    
    always_comb begin
        o_LEDS <= i_data;  // shows data on LEDs
        if (i_type == 1) begin  // showing in DEC
            case (i_data / 10)
                0: o_HEX4 <= num0;
                1: o_HEX4 <= num1;
                2: o_HEX4 <= num2;
                3: o_HEX4 <= num3;
                4: o_HEX4 <= num4;
                5: o_HEX4 <= num5;
                6: o_HEX4 <= num6;
                7: o_HEX4 <= num7;
                8: o_HEX4 <= num8;
                9: o_HEX4 <= num9;
                default: o_HEX4 <= numOff;
            endcase
            case (i_data % 10)
                0: o_HEX3 <= num0;
                1: o_HEX3 <= num1;
                2: o_HEX3 <= num2;
                3: o_HEX3 <= num3;
                4: o_HEX3 <= num4;
                5: o_HEX3 <= num5;
                6: o_HEX3 <= num6;
                7: o_HEX3 <= num7;
                8: o_HEX3 <= num8;
                9: o_HEX3 <= num9;
                default: o_HEX3 <= numOff;
            endcase
            o_HEX2 <= numOff;
            o_HEX1 <= numOff;
            o_HEX0 <= numOff;
        end else begin  // showing in BIN
            o_HEX4 <= i_data[4] ? num1 : num0;  // HEX4
            o_HEX3 <= i_data[3] ? num1 : num0;  // HEX3
            o_HEX2 <= i_data[2] ? num1 : num0;  // HEX2
            o_HEX1 <= i_data[1] ? num1 : num0;  // HEX1
            o_HEX0 <= i_data[0] ? num1 : num0;  // HEX0
        end
    end
endmodule
