//rs232 serial
module rs232 #(
parameter UART_BPS = 'd9600, //uart baud rate
parameter CLK_FREQ = 'd50_000_000 //clk freq
)
(
   input wire sys_clk, sys_rst_n, rx,

   output wire tx
);

wire [7:0] po_data;
wire po_flag;

uart_rx uart_rx_inst0 (
   .sys_clk(sys_clk),
   .sys_rst_n(sys_rst_n),
   .rx(rx),

   .po_flag(po_flag),
   .po_data(po_data)
);

uart_tx uart_tx_inst0 (
   .sys_clk(sys_clk),
   .sys_rst_n(sys_rst_n),
   .pi_flag(po_flag),
   .pi_data(po_data),

   .tx(tx)
);

endmodule