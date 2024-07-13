# Asynchronous_FIFO

## Signals

### `synchronizer` Module

<ul>
    <li><strong>clk</strong>: Clock signal for the synchronizer.</li>
    <li><strong>rst_n</strong>: Active low reset signal.</li>
    <li><strong>d_in</strong>: Input data signal to be synchronized.</li>
    <li><strong>d_out</strong>: Synchronized output data signal.</li>
    <li><strong>q1</strong>: Intermediate register to hold the synchronized data.</li>
</ul>

### `wptr_handler` Module

<ul>
    <li><strong>wclk</strong>: Write clock signal.</li>
    <li><strong>wrst_n</strong>: Active low write reset signal.</li>
    <li><strong>w_en</strong>: Write enable signal.</li>
    <li><strong>g_rptr_sync</strong>: Synchronized Gray code read pointer from the read clock domain.</li>
    <li><strong>b_wptr</strong>: Binary write pointer.</li>
    <li><strong>g_wptr</strong>: Gray code write pointer.</li>
    <li><strong>full</strong>: Full flag indicating the FIFO is full.</li>
    <li><strong>b_wptr_next</strong>: Next state of the binary write pointer.</li>
    <li><strong>g_wptr_next</strong>: Next state of the Gray code write pointer.</li>
    <li><strong>wrap_around</strong>: Signal to handle the wrap-around condition.</li>
    <li><strong>wfull</strong>: Write full condition signal.</li>
</ul>

### `rptr_handler` Module

<ul>
    <li><strong>rclk</strong>: Read clock signal.</li>
    <li><strong>rrst_n</strong>: Active low read reset signal.</li>
    <li><strong>r_en</strong>: Read enable signal.</li>
    <li><strong>g_wptr_sync</strong>: Synchronized Gray code write pointer from the write clock domain.</li>
    <li><strong>b_rptr</strong>: Binary read pointer.</li>
    <li><strong>g_rptr</strong>: Gray code read pointer.</li>
    <li><strong>empty</strong>: Empty flag indicating the FIFO is empty.</li>
    <li><strong>b_rptr_next</strong>: Next state of the binary read pointer.</li>
    <li><strong>g_rptr_next</strong>: Next state of the Gray code read pointer.</li>
    <li><strong>rempty</strong>: Read empty condition signal.</li>
</ul>

### `fifo_mem` Module

<ul>
    <li><strong>wclk</strong>: Write clock signal.</li>
    <li><strong>w_en</strong>: Write enable signal.</li>
    <li><strong>rclk</strong>: Read clock signal.</li>
    <li><strong>r_en</strong>: Read enable signal.</li>
    <li><strong>b_wptr</strong>: Binary write pointer.</li>
    <li><strong>b_rptr</strong>: Binary read pointer.</li>
    <li><strong>data_in</strong>: Data input to the FIFO.</li>
    <li><strong>full</strong>: Full flag indicating the FIFO is full.</li>
    <li><strong>empty</strong>: Empty flag indicating the FIFO is empty.</li>
    <li><strong>data_out</strong>: Data output from the FIFO.</li>
    <li><strong>fifo</strong>: Array representing the FIFO memory.</li>
</ul>

### `asynchronous_fifo` Module

<ul>
    <li><strong>wclk</strong>: Write clock signal.</li>
    <li><strong>wrst_n</strong>: Active low write reset signal.</li>
    <li><strong>rclk</strong>: Read clock signal.</li>
    <li><strong>rrst_n</strong>: Active low read reset signal.</li>
    <li><strong>w_en</strong>: Write enable signal.</li>
    <li><strong>r_en</strong>: Read enable signal.</li>
    <li><strong>data_in</strong>: Data input to the FIFO.</li>
    <li><strong>data_out</strong>: Data output from the FIFO.</li>
    <li><strong>full</strong>: Full flag indicating the FIFO is full.</li>
    <li><strong>empty</strong>: Empty flag indicating the FIFO is empty.</li>
    <li><strong>g_wptr_sync</strong>: Synchronized Gray code write pointer from the write clock domain.</li>
    <li><strong>g_rptr_sync</strong>: Synchronized Gray code read pointer from the read clock domain.</li>
    <li><strong>b_wptr</strong>: Binary write pointer.</li>
    <li><strong>b_rptr</strong>: Binary read pointer.</li>
    <li><strong>g_wptr</strong>: Gray code write pointer.</li>
    <li><strong>g_rptr</strong>: Gray code read pointer.</li>
    <li><strong>waddr</strong>: Write address in the FIFO memory.</li>
    <li><strong>raddr</strong>: Read address in the FIFO memory.</li>
</ul>

### `async_fifo_TB` Testbench

<ul>
    <li><strong>data_out</strong>: Data output from the FIFO.</li>
    <li><strong>full</strong>: Full flag indicating the FIFO is full.</li>
    <li><strong>empty</strong>: Empty flag indicating the FIFO is empty.</li>
    <li><strong>data_in</strong>: Data input to the FIFO.</li>
    <li><strong>w_en</strong>: Write enable signal.</li>
    <li><strong>wclk</strong>: Write clock signal.</li>
    <li><strong>wrst_n</strong>: Active low write reset signal.</li>
    <li><strong>r_en</strong>: Read enable signal.</li>
    <li><strong>rclk</strong>: Read clock signal.</li>
    <li><strong>rrst_n</strong>: Active low read reset signal.</li>
    <li><strong>wdata_q</strong>: Queue to hold data for writing to the FIFO.</li>
    <li><strong>wdata</strong>: Data being written to or read from the FIFO.</li>
</ul>
