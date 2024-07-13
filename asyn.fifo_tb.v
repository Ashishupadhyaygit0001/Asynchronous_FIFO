`include "asynchronous_fifo.v"

module async_fifo_TB;
  parameter DATA_WIDTH = 8;

  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;

  reg [DATA_WIDTH-1:0] data_in;
  reg w_en, wclk, wrst_n;
  reg r_en, rclk, rrst_n;

  // Queue to push data_in (Using a static array instead)
  reg [DATA_WIDTH-1:0] wdata_q [0:99]; // Assuming max 100 elements for simplicity
  integer write_ptr, read_ptr;
  reg [DATA_WIDTH-1:0] wdata;

  // Declare loop variable
  integer i;

  asynchronous_fifo #(8, DATA_WIDTH) as_fifo (
    .wclk(wclk), 
    .wrst_n(wrst_n),
    .rclk(rclk), 
    .rrst_n(rrst_n),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );

  always #10 wclk = ~wclk;
  always #35 rclk = ~rclk;

  initial begin
    wclk = 1'b0; 
    wrst_n = 1'b0;
    w_en = 1'b0;
    data_in = 0;
    write_ptr = 0;
    read_ptr = 0;

    repeat(10) @(posedge wclk);
    wrst_n = 1'b1;

    repeat(2) begin
      for (i = 0; i < 30; i = i + 1) begin
        @(posedge wclk);
        if (!full) begin
          w_en = (i % 2 == 0) ? 1'b1 : 1'b0;
          if (w_en) begin
            data_in = $urandom;
            wdata_q[write_ptr] = data_in;
            write_ptr = write_ptr + 1;
          end
        end
      end
      #50;
    end
  end

  initial begin
    rclk = 1'b0; 
    rrst_n = 1'b0;
    r_en = 1'b0;

    repeat(20) @(posedge rclk);
    rrst_n = 1'b1;

    repeat(2) begin
      for (i = 0; i < 30; i = i + 1) begin
        @(posedge rclk);
        if (!empty) begin
          r_en = (i % 2 == 0) ? 1'b1 : 1'b0;
          if (r_en) begin
            wdata = wdata_q[read_ptr];
            read_ptr = read_ptr + 1;
            if (data_out !== wdata) 
              $error("Time = %0t: Comparison Failed: expected wr_data = %h, rd_data = %h", $time, wdata, data_out);
            else 
              $display("Time = %0t: Comparison Passed: wr_data = %h and rd_data = %h", $time, wdata, data_out);
          end
        end
      end
      #50;
    end
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule
