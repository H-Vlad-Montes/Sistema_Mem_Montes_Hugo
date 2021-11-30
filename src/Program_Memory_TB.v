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
reg [(DATA_WIDTH-1):0] write_data;
wire [(DATA_WIDTH-1):0] ReadData;
  
memory_system_wrapper
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUV
(
	.clk(clk_tb),
	.while_enable_i(write_enable),
	.address_i(Address_i_tb),
	.write_data( write_data),
	.instruction_o(ReadData)
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/


initial begin
//ram memory instance
	#0 Address_i_tb =  32'h10010000;
	#1 write_enable = 1;
	#1  write_data <= 32'hFFFFFFFF;

	#50  write_data <= 32'h00000000;
	#1 Address_i_tb = 32'h10010000;

	#50 Address_i_tb = 32'h10010008;
	#1  write_data <= 32'h12345678;

	#50 Address_i_tb = 32'h1001000c;
	#1  write_data <= 32'h98761234;

	#50 Address_i_tb = 32'h10010010;
	#1  write_data <= 32'hA0A0A0A0;

	#50 Address_i_tb = 32'h10010014;
	#1  write_data <= 32'hABCDEF12;
//rom memory instance
	#50 Address_i_tb <= 32'h400000;
	#50 Address_i_tb <= 32'h400004; //address 01
	#50 Address_i_tb <= 32'b0000_0000_0100_0000_0000_0000_0000_1000;
	#50 Address_i_tb <= 32'h40000c;
	#50 Address_i_tb <= 32'h400010;
	#50 Address_i_tb <= 32'h400014;
	#50 Address_i_tb <= 32'h400018;
	#50 Address_i_tb <= 32'h40001c;
	#50 Address_i_tb <= 32'h400020; //direccion sin datos escritos
	#50 Address_i_tb <= 32'h400024; 
//ram & rom memory instance ramdom test
	#50 write_data <=  32'h115A115C;
	#1 Address_i_tb <= 32'h1001000c;
	#50 Address_i_tb <= 32'h10010010;

	#50 Address_i_tb = 32'h10010014;
	

end


/*********************************************************/

endmodule