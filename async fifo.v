module async_fifo
#(
parameter DSIZE = 8,
parameter ASIZE = 4
)
(
input wclk,
input wrst_n,
input winc,

input rclk,
input rrst_n,
input rinc,

input [DSIZE-1:0] wdata,

output [DSIZE-1:0] rdata,
output wfull,
output rempty
);

wire [ASIZE:0] wptr;
wire [ASIZE:0] rptr;

wire [ASIZE:0] wq2_rptr;
wire [ASIZE:0] rq2_wptr;

wire [ASIZE-1:0] waddr;
wire [ASIZE-1:0] raddr;

sync_r2w #(ASIZE) u1 (
.wclk(wclk),
.wrst_n(wrst_n),
.rptr(rptr),
.wq2_rptr(wq2_rptr)
);

sync_w2r #(ASIZE) u2 (
.rclk(rclk),
.rrst_n(rrst_n),
.wptr(wptr),
.rq2_wptr(rq2_wptr)
);

fifo_mem #(DSIZE,ASIZE) u3 (
.wclk(wclk),
.wclken(winc),
.wfull(wfull),
.waddr(waddr),
.raddr(raddr),
.wdata(wdata),
.rdata(rdata)
);

rptr_empty #(ASIZE) u4 (
.rclk(rclk),
.rrst_n(rrst_n),
.rinc(rinc),
.rq2_wptr(rq2_wptr),
.rempty(rempty),
.raddr(raddr),
.rptr(rptr)
);

wptr_full #(ASIZE) u5 (
.wclk(wclk),
.wrst_n(wrst_n),
.winc(winc),
.wq2_rptr(wq2_rptr),
.wfull(wfull),
.waddr(waddr),
.wptr(wptr)
);

endmodule
