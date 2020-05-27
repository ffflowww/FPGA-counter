module counter #(
    parameter Initial  // initial value
) (
    input logic i_set,  //port: signal for setting the initial value
    input logic i_reset,  // port: reset
    input logic i_clk,  // port: synchro signal (clock)
    input logic i_pause,  // port: pause programm
    input logic i_count,  // port: HIGH - increment (LOW - shift to the left)

    output logic [4:0] o_data // port(bus): output value
);
    
    localparam p_min_value = 5'b 00000;  //  parameter minimum value
    localparam p_max_value = 5'b 10000;  //  parameter maximum value
    
    always_ff @(posedge i_clk, negedge i_reset) begin
        /* reset logic */
        if (~i_reset) o_data <= p_min_value;
        
        /* pause logic */
        else if (i_pause == 1) o_data <= o_data;
        
        /* initializing logic */
        else if (i_set == 1) o_data <= Initial;
        
        /* default logic */
        else begin
            //increment till p_max logic
            if (i_count == 1) begin
                if (o_data >= p_max_value) o_data <= p_min_value;
                else o_data <= o_data + 1;                               
            end else begin  // left shift logic
                o_data[4:1] <= o_data[3:0];
                o_data[0] <= o_data[4];
            end
        end
    end
    
endmodule
