module top_entity #(
    parameter Initial = 5'b 01001,
    parameter Frequency = 10000  // needed frequency
) (
    input logic i_clock_50mhz,  // сlock 50mhz
    input logic i_reset,  // port: reset
    input logic i_set,  //port: signal for setting the initial value
    input logic i_pause,  // port: pause programm
    input logic i_count,  // port: HIGH - increment (LOW - shift to the left)
    input logic i_type,  // port: signal HIGH - DEC, otherwise - BIN 

    output logic [6:0] o_HEXs[4:0],
    output logic [4:0] o_LEDs,
    output logic o_sync_clock  // right clock
    );
    
    // inner wires
    logic [4:0] w_data;  // wire between modules
    logic w_clock;  // wire between clock devider and counter
    logic [6:0] w_bin_HEXs[4:0];
    logic [6:0] w_dec_HEXs[4:0];
    assign o_sync_clock = w_clock;
    
    // Modules
    clock_divider #(
        .Frequency(Frequency)
    ) main_clock_divider (   
        .i_clock_50mhz(i_clock_50mhz),
        .i_reset(i_reset),
        
        .o_clk(w_clock)
    );
    
    counter #(
        .Initial(Initial)
    ) main_counter (   
        .i_set(i_set),
        .i_reset(i_reset),
        .i_clk(w_clock),
        .i_pause(i_pause),
        .i_count(i_count),
        
        .o_data(w_data)
    );
    
    led_decoder main_led_decoder (   
        .i_data(w_data),
        
        .o_LEDs
    );
    
    bin_decoder main_bin_decoder (   
        .i_data(w_data),
        
        .o_bin_HEXs(w_bin_HEXs)
    );
    
    dec_decoder main_dec_decoder (   
        .i_data(w_data),
        
        .o_dec_HEXs(w_dec_HEXs)
    );
    
    multiplexer main_multiplexer(
        .i_bin_HEXs(w_bin_HEXs),
        .i_dec_HEXs(w_dec_HEXs),
        .i_type,
        
        .o_HEXs
);
    
    

endmodule
