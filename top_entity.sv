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
    
    output logic [6:0] o_HEX0,
    output logic [6:0] o_HEX1,
    output logic [6:0] o_HEX2,
    output logic [6:0] o_HEX3,
    output logic [6:0] o_HEX4,
    output logic [4:0] o_LEDS,
    output logic o_sync_clock  // right clock
    );
    
    // inner wires
    logic [4:0] w_data;  // wire between modules
    logic w_clock;  // wire between clock devider and counter
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
    
    rsp main_rsp (   
        .i_data(w_data),
        .i_type(i_type),
        
        .o_HEX0(o_HEX0),
        .o_HEX1(o_HEX1),
        .o_HEX2(o_HEX2),
        .o_HEX3(o_HEX3),
        .o_HEX4(o_HEX4),
        .o_LEDS(o_LEDS)
    );

endmodule
