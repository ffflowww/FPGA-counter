`timescale 1ns/1ns
module test;
    
    logic i_clock_50mhz;
    logic i_set;
    logic i_reset;
    logic i_pause;
    logic i_count;
    logic i_type;
    
    logic [6:0] o_HEXs[4:0];
    logic [4:0] o_LEDs;
    logic o_sync_clock;
    
    parameter Initial = 5'b 01001;
    parameter Frequency = 1000000;
    
    localparam logic [31:0] MaxClockBuf = 50000000 / (Frequency * 2);
    
    logic [63:0] clock_tick_buf = 0;
    
    top_entity #(
        .Frequency(Frequency),
        .Initial(Initial)
    )
    device(.*);
    
    // initialization
    initial begin
        i_clock_50mhz <= 0;
        i_set <= 0;
        i_pause <= 0;
        i_type <= 0;
        i_count <= 1;
        i_reset <= 1;
        
        fork 
            // block 1 - clock simulation
            forever #1 i_clock_50mhz = ~i_clock_50mhz;
            
            // block 2 - signals' vectors
            begin
                #(5*MaxClockBuf) i_reset <= ~i_reset;
                #(10*MaxClockBuf) i_reset <= ~i_reset;
                #(15*MaxClockBuf) i_set <= ~i_set;
                #(20*MaxClockBuf) i_set <= ~i_set;
                #(25*MaxClockBuf) i_pause <= ~i_pause;
                #(30*MaxClockBuf) i_pause <= ~i_pause;
                #(40*MaxClockBuf) i_type <= ~i_type;
                #(60*MaxClockBuf) i_count <= ~i_count;
                #(70*MaxClockBuf) i_type <= ~i_type;
                #(90*MaxClockBuf) i_count <= ~i_count;
            end
            
            // block 3 - clock print
            forever begin
                @(posedge o_sync_clock);
                clock_tick_buf += 64'd1;
                $display ("Modulated clock tick: %d\n", clock_tick_buf);
            end
        join
    end

endmodule
