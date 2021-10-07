module test_6_7;
    import chap_6::*;
    MemTrans MyMemTrans;
    initial begin
        MyMemTrans.valid_rw_address.constraint_mode(0);
        assert(MyMemTrans.randomize() with {(rw==0)->(address inside {[8:0]});})
            else $fatal(0, "MyMemTrans::randomize failed");
    end
endmodule