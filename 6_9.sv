module test_6_9;
    import chap_6::*;
    StimData sd;
    initial begin
        repeat (20) begin
            sd = new;
            assert(sd.randomize())
                else $fatal(0, "sd::randomize failed");
            $display("Created and %0d element array", sd.data.size());
        end
    end
endmodule