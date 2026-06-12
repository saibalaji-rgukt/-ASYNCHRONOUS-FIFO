module wptr_full
#(
    parameter ADDRSIZE = 4
)
(
    input                   wclk,
    input                   wrst_n,
    input                   winc,
    input  [ADDRSIZE:0]     wq2_rptr,

    output [ADDRSIZE-1:0]   waddr,
    output reg [ADDRSIZE:0] wptr,
    output reg              wfull
);

reg [ADDRSIZE:0] wbin;
wire [ADDRSIZE:0] wbinnext;
wire [ADDRSIZE:0] wgraynext;
wire wfull_next;
assign wbinnext = wbin + (winc & ~wfull);
assign wgraynext = (wbinnext >> 1) ^ wbinnext;
assign waddr = wbin[ADDRSIZE-1:0];
assign wfull_next =
    (wgraynext ==
     {~wq2_rptr[ADDRSIZE:ADDRSIZE-1],
       wq2_rptr[ADDRSIZE-2:0]});

always @(posedge wclk or negedge wrst_n)
begin
    if(!wrst_n)
    begin
        wbin  <= 0;
        wptr  <= 0;
        wfull <= 1'b0;
    end
    else
    begin
        wbin  <= wbinnext;
        wptr  <= wgraynext;
        wfull <= wfull_next;
    end
end

endmodule
