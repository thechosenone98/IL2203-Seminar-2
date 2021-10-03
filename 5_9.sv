module test_5_9;
    import chap_5::*;

    MemTrans src, dst;
    initial begin
        src = new();
        src.stat.start();
        #5;
        src.stat.stop();
        dst = src.copy();
        dst.stat.start();
        #10;
        dst.stat.stop();
        $display("Source stat start time: %0d", src.stat.startT);
        $display("Copy stat start time: %0d", dst.stat.startT);
        $display("Total run time: %0d", Statistics::total_time_elapsed);
    end
endmodule