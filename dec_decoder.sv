module dec_decoder(
    input logic i_clk,
    input logic i_reset,
    input logic [4:0] i_data,
    
    output logic [6:0] o_dec_HEXs[4:0]
);

// local parameters for 7-segment display
localparam NUM_0 = 7'b 1000000;
localparam NUM_1 = 7'b 1111001;
localparam NUM_2 = 7'b 0100100;
localparam NUM_3 = 7'b 0110000;
localparam NUM_4 = 7'b 0011001;
localparam NUM_5 = 7'b 0010010;
localparam NUM_6 = 7'b 0000010;
localparam NUM_7 = 7'b 1111000;
localparam NUM_8 = 7'b 0000000;
localparam NUM_9 = 7'b 0010000;
localparam NUM_OFF = 7'b 1111111;

always_ff @(posedge i_clk, negedge i_reset) begin
    if(~i_reset) o_dec_HEXs <= '{5{7'd0}};
    else begin
        unique case (i_data / 10)
            0: o_dec_HEXs[4] <= NUM_0;
            1: o_dec_HEXs[4] <= NUM_1;
            2: o_dec_HEXs[4] <= NUM_2;
            3: o_dec_HEXs[4] <= NUM_3;
            4: o_dec_HEXs[4] <= NUM_4;
            5: o_dec_HEXs[4] <= NUM_5;
            6: o_dec_HEXs[4] <= NUM_6;
            7: o_dec_HEXs[4] <= NUM_7;
            8: o_dec_HEXs[4] <= NUM_8;
            9: o_dec_HEXs[4] <= NUM_9;
        endcase
        unique case (i_data % 10)
            0: o_dec_HEXs[3] <= NUM_0;
            1: o_dec_HEXs[3] <= NUM_1;
            2: o_dec_HEXs[3] <= NUM_2;
            3: o_dec_HEXs[3] <= NUM_3;
            4: o_dec_HEXs[3] <= NUM_4;
            5: o_dec_HEXs[3] <= NUM_5;
            6: o_dec_HEXs[3] <= NUM_6;
            7: o_dec_HEXs[3] <= NUM_7;
            8: o_dec_HEXs[3] <= NUM_8;
            9: o_dec_HEXs[3] <= NUM_9;
        endcase
        // turn off unnecessary displays
        o_dec_HEXs[2] <= NUM_OFF;
        o_dec_HEXs[1] <= NUM_OFF;
        o_dec_HEXs[0] <= NUM_OFF;
    end
end
endmodule
