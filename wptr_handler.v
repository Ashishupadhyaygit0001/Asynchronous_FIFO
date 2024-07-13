module wptr_handler #(parameter PTR_WIDTH=3) (
  input wire wclk, wrst_n, w_en,
  input wire [PTR_WIDTH:0] g_rptr_sync,
  output reg [PTR_WIDTH:0] b_wptr, g_wptr,
  output reg full
);

  reg [PTR_WIDTH:0] b_wptr_next;
  reg [PTR_WIDTH:0] g_wptr_next;
  
  wire wfull;

  always @(*) begin
    b_wptr_next = b_wptr + (w_en & !full);
    g_wptr_next = (b_wptr_next >> 1) ^ b_wptr_next;
  end

  always @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) begin
      b_wptr <= 0; // set default value
      g_wptr <= 0;
    end else begin
      b_wptr <= b_wptr_next; // increment binary write pointer
      g_wptr <= g_wptr_next; // increment gray write pointer
    end
  end

  always @(posedge wclk or negedge wrst_n) begin
    if (!wrst_n) 
      full <= 0;
    else 
      full <= wfull;
  end

  assign wfull = (g_wptr_next == {~g_rptr_sync[PTR_WIDTH:PTR_WIDTH-1], g_rptr_sync[PTR_WIDTH-2:0]});

endmodule
