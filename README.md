<!DOCTYPE html>
<html>


<head>
</head>
<body>
    <h2>Asynchronous FIFO</h2>
    <p>
        In asynchronous FIFO, data read and write operations use different clock frequencies.
        Since write and read clocks are not synchronized, it is referred to as asynchronous FIFO.
        Usually, these are used in systems where data need to pass from one clock domain to
        another which is generally termed as ‘clock domain crossing’. Thus, asynchronous FIFO
        helps to synchronize data flow between two systems working on different clocks.

</body>
</html>

![image](https://github.com/user-attachments/assets/fb75c745-d019-4c74-9387-c83e4dce0cf2)


<!DOCTYPE html>
<html>

<body>
    <h2>Asynchronous FIFO Operation</h2>
    <p>
        In the case of asynchronous FIFO, the write pointer is aligned to the write clock domain 
        whereas the read pointer is aligned to the read clock domain. Hence, it requires domain crossing 
        to calculate FIFO full and empty conditions. This causes metastability in the actual design. 
        In order to resolve this metastability, 2 flip-flops or 3 flip-flops synchronizer can be used to pass 
        write and read pointers. A single “2 FF synchronizer” can resolve metastability for only one bit. 
        Hence, depending on write and read pointers, multiple 2FF synchronizers are required.
    </p>
</body>
</html>

<!DOCTYPE html>
<html lang="en">
<body>
    <h1>Usage of Binary to Gray code converter and vice-versa in Asynchronous FIFO</h1>
    We should not pass binary formatted write and read pointer values. Due to metastability, the overall write or read pointer value might be different.<br>
    <p>Example: When binary value <code>wr_ptr = 4'b1101</code> at the write clock domain is transferred via 2FF synchronizer, at the read clock domain <code>wr_ptr</code> value may be received as <code>4'b1111</code> or any other value that is not acceptable. Whereas gray code is assured to have only a single bit change from its previous value. Hence, both write and read pointers need to convert 
first to their equivalent gray code in their corresponding domain and then pass them to 
an opposite domain.</p>
</body>
</html>



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
