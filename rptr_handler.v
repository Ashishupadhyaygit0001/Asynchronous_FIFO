module rptr_handler #(parameter PTR_WIDTH=3) (
  input wire rclk, rrst_n, r_en,
  input wire [PTR_WIDTH:0] g_wptr_sync,
  output reg [PTR_WIDTH:0] b_rptr, g_rptr,
  output reg empty
);

  reg [PTR_WIDTH:0] b_rptr_next;
  reg [PTR_WIDTH:0] g_rptr_next;
  
  wire rempty;

  always @(*) begin
    b_rptr_next = b_rptr + (r_en & !empty);
    g_rptr_next = (b_rptr_next >> 1) ^ b_rptr_next;
  end

  always @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) begin
      b_rptr <= 0;
      g_rptr <= 0;
    end else begin
      b_rptr <= b_rptr_next;
      g_rptr <= g_rptr_next;
    end
  end

  always @(posedge rclk or negedge rrst_n) begin
    if (!rrst_n) 
      empty <= 1;
    else 
      empty <= rempty;
  end

  assign rempty = (g_wptr_sync == g_rptr_next);

endmodule
