`timescale 1ns/1ns
// test programm
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
    
    localparam logic [31:0] lp_max_clock_buf = 50000000 / (Frequency * 2);
    
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
                #(15*lp_max_clock_buf) i_reset <= ~i_reset;
                #(40*lp_max_clock_buf) i_reset <= ~i_reset;
                #(60*lp_max_clock_buf) i_set <= ~i_set;
                #(80*lp_max_clock_buf) i_set <= ~i_set;
                #(130*lp_max_clock_buf) i_pause <= ~i_pause;
                #(170*lp_max_clock_buf) i_pause <= ~i_pause;
                #(230*lp_max_clock_buf) i_type <= ~i_type;
                #(300*lp_max_clock_buf) i_count <= ~i_count;
                #(350*lp_max_clock_buf) i_type <= ~i_type;
                #(500*lp_max_clock_buf) i_count <= ~i_count;
            end
            
            // block 3 - clock print
            forever begin
                @(posedge o_sync_clock);
                $display ("real clock tick: %t\n",$time());
            end
        join
    end

endmodule
