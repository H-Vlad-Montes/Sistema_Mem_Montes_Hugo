/******************************************************************
* Description
*	This is the verifaction envioroment ofr testeting the register file.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	12/06/2015
******************************************************************/

module Program_Memory_TB;

parameter MEMORY_DEPTH = 32;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg write_enable;
reg [(DATA_WIDTH-1):0] Address_i_tb;
reg [(DATA_WIDTH-1):0] Instruction_o_tb;
wire [(DATA_WIDTH-1):0] ReadData;
  
single_port_ram
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUV
(
	.clk(clk_tb),
	.write_enable(write_enable),
	.address(Address_i_tb),
	.WriteData(Instruction_o_tb),
	.ReadData(ReadData)
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/


initial begin
	#0 Address_i_tb =  32'h10010000;
	#1 write_enable = 1;
	#1 Instruction_o_tb <= 32'hFFFFFFFF;

	#50 Instruction_o_tb <= 32'h00000000;
	#1 Address_i_tb = 32'h10010000;

	#50 Address_i_tb = 32'h10010008;
	#1 Instruction_o_tb <= 32'h12345678;

	#50 Address_i_tb = 32'h1001000c;
	#1 Instruction_o_tb <= 32'h98761234;

	#50 Address_i_tb = 32'h10010010;
	#1 Instruction_o_tb <= 32'hA0A0A0A0;

	#50 Address_i_tb = 32'h10010014;
	#1 Instruction_o_tb <= 32'hABCDEF12;


end


/*********************************************************/

endmodule