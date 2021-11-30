module single_port_ram #(
	parameter DATA_WIDTH=32,
	parameter MEMORY_DEPTH = 64
)
(
	input write_enable,		//debo de escribir?
	input clk,
	input [DATA_WIDTH-1:0] WriteData,// que se va a escribir
	input [DATA_WIDTH-1:0]  address, //donde se va a escribir
	
	output [DATA_WIDTH-1:0]  ReadData//esto es lo que escribi
	
);
	
	reg [DATA_WIDTH-1:0] ram[MEMORY_DEPTH-1:0];
	reg [DATA_WIDTH-1:0] ReadDataAux = 32'h1001_0000;

	always @ (posedge clk)
	begin
		// Write
		if (write_enable)
			ram[(address-ReadDataAux) >> 2] <= WriteData;
	end
	
	assign ReadData = ram[(address-ReadDataAux) >> 2];

endmodule
