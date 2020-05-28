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
    
    localparam MinValue = 5'b00000;  // parameter minimum value
    localparam MaxValue = 5'b10000;  // parameter maximum value
    
    always_ff @(posedge i_clk, negedge i_reset) begin
        /* reset logic */
        if (~i_reset) o_data <= MinValue;
        
        /* pause logic */
        else if (i_pause == 1) o_data <= o_data;
        
        /* initializing logic */
        else if (i_set == 1) o_data <= Initial;
        
        /* default logic */
        else begin
            //increment till p_max logic
            if (i_count == 1) begin
                if (o_data >= MaxValue) o_data <= MinValue;
                else o_data <= o_data + 5'd1;                               
            end else begin  // left shift logic
                o_data[4:1] <= o_data[3:0];
                o_data[0] <= o_data[4];
            end
        end
    end
    
endmodule
