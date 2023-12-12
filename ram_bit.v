module ram_bit #(
    parameter AWIDTH = 2
) (
    CLK,
    PORT_A_ADDRESS,
    PORT_A_OUT,

    PORT_B_ADDRESS,
    PORT_B_OUT,

    PORT_C_ADDRESS,
    PORT_C_DATA,
    PORT_C_WE
);

input CLK;
input [AWIDTH-1:0] PORT_A_ADDRESS;
output PORT_A_OUT;

input [AWIDTH-1:0] PORT_B_ADDRESS;
output PORT_B_OUT;

input [AWIDTH-1:0] PORT_C_ADDRESS;
input PORT_C_DATA;
input PORT_C_WE;

ram_mlab_bit MEM1 (
	.clock(!CLK),
	.rdaddress({6'b00,PORT_A_ADDRESS}),
	.wraddress({6'b00,PORT_C_ADDRESS}),
	.data(PORT_C_DATA),
	.wren(!PORT_C_WE),
	.q(PORT_A_OUT)
);

ram_mlab_bit MEM2 (
	.clock(!CLK),
	.rdaddress({6'b00,PORT_B_ADDRESS}),
	.wraddress({6'b00,PORT_C_ADDRESS}),
	.data(PORT_C_DATA),
	.wren(!PORT_C_WE),
	.q(PORT_B_OUT)
);

endmodule