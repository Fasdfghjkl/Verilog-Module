//count 100ms
module cnt_100ms #(
    parameter CNT_MAX = 23'd4_999_999
)
(
    input wire sys_clk,
    input wire sys_rst_n,

    output reg cnt_flag
);

reg [22:0] cnt;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
    cnt <= 23'd0;
    else if(cnt == CNT_MAX)
    cnt<= 23'd0;
    else
    cnt <= cnt + 23'd1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
    cnt_flag <= 1'b0;
    else if(cnt == (CNT_MAX - 23'd1))
    cnt_flag <= 1'b1;
    else
    cnt_flag <= 1'b0;
end

endmodule