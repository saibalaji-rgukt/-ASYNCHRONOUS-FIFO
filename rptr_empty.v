module rptr_empty
#(
    parameter ADDRSIZE = 4
)
(
    input                   rclk,
    input                   rrst_n,
    input                   rinc,
    input  [ADDRSIZE:0]     rq2_wptr,

    output [ADDRSIZE-1:0]   raddr,
    output reg [ADDRSIZE:0] rptr,
    output reg              rempty
);

reg [ADDRSIZE:0] rbin;

wire [ADDRSIZE:0] rbinnext;
wire [ADDRSIZE:0] rgraynext;
wire rempty_next;

assign rbinnext = rbin + (rinc & ~rempty);

assign rgraynext = (rbinnext >> 1) ^ rbinnext;

assign raddr = rbin[ADDRSIZE-1:0];

assign rempty_next = (rgraynext == rq2_wptr);

always @(posedge rclk or negedge rrst_n)
begin
    if(!rrst_n)
    begin
        rbin   <= 0;
        rptr   <= 0;
        rempty <= 1'b1;
    end
    else
    begin
        rbin   <= rbinnext;
        rptr   <= rgraynext;
        rempty <= rempty_next;
    end
end

endmodule
