module test_6_1;
    import chap_6::*;
    Exercise1 ex1;
    initial begin
        ex1 = new();
        if(!ex1.randomize())
            $finish;
        $display("Address: %h, Data: %h", ex1.address, ex1.data);
    end
endmodule