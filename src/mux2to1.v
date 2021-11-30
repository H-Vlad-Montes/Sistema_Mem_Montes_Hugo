module mux2to1 #(
   // constant declaration
  parameter DATA_WIDTH = 32

)(
   input [(DATA_WIDTH-1):0] x,
   input [(DATA_WIDTH-1):0] y,
	input Sel,
	output [(DATA_WIDTH-1):0] Data_out
   
);

assign Data_out = Sel ? x : y ; 
endmodule 