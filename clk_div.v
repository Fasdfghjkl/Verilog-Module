module clk_div (
	input wire sys_clk, sys_rst_n,

	output wire locked,
    output reg div_clk
);

always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n)
	div_clk <= 1'b0;
	else
	div_clk <= ~div_clk;
end

assign locked = sys_rst_n ? 1'b1 : 1'b0;

endmodule