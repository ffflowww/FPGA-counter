module clock_divider #(
    parameter Frequency  // needed frequency of clock
) (
    input logic i_clock_50mhz,  // port: raw 50mhz clock
    input logic i_reset,  // port: reset

    output logic o_clk // port: normalized clock
);
   
    localparam logic [31:0] lp_max_clock_buf = 50000000 / (Frequency * 2);
    logic [31:0] clock_buf = 0;  // buffer for clock
   
    always_ff @(posedge i_clock_50mhz) begin
        /* reset logic */
        if (~i_reset) begin
            o_clk <= 0;
            clock_buf <= 0;
        end else begin /* normal execution */
            clock_buf <= clock_buf + 1;
            if (clock_buf >= lp_max_clock_buf) begin
                o_clk <= ~o_clk;
                clock_buf <= 0;
            end
        end
    end

endmodule
