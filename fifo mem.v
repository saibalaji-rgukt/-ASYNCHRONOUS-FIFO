module fifo_mem
#(
parameter DATASIZE = 8,
parameter ADDRSIZE = 4
)
(
input wclk,
input wclken,
input wfull,

input [ADDRSIZE-1:0] waddr,
input [ADDRSIZE-1:0] raddr,

input [DATASIZE-1:0] wdata,

output [DATASIZE-1:0] rdata
);

localparam DEPTH = 1<<ADDRSIZE;

reg [DATASIZE-1:0] mem [0:DEPTH-1];

integer i;

initial begin
    for(i=0;i<DEPTH;i=i+1)
        mem[i] = 0;
end

always @(posedge wclk)
begin
    if(wclken && !wfull)
        mem[waddr] <= wdata;
end

assign rdata = mem[raddr];

endmodule
