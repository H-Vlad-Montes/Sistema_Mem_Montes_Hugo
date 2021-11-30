//TB ROM
module TB_MemorySystem;
    parameter DATA_WIDTH=32; 
    parameter ADDR_WIDTH=64;
    reg TB_clk;
    reg [(DATA_WIDTH-1):0] TB_addr;
    wire [(DATA_WIDTH-1):0] TB_q;

    single_port_rom
    #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH))
    DUV(
        .addr(TB_addr),
        .q(TB_q)
        );

    initial begin
    forever #1 TB_clk = ~TB_clk;
    end
    initial begin
        //#0 TB_addr <= 0;
        //#0 TB_q <= 0;
        #10TB_addr <= 32'h400000;
        #10TB_addr <= 32'h400004; //address 01
        #10TB_addr <= 32'b0000_0000_0100_0000_0000_0000_0000_1000; //400008
        #10TB_addr <= 32'h40000c;
        #10TB_addr <= 32'h400010;
        #10TB_addr <= 32'h400014;
        #10TB_addr <= 32'h400018;
        #10TB_addr <= 32'h40001c;
        #10TB_addr <= 32'h400020; //direccion sin datos escritos
        #10TB_addr <= 32'h400024; 
        end
endmodule