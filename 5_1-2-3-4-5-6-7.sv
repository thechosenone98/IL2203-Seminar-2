module test_5_1_2_3_4_5_6_7();
    import chap_5::*;

    MemTrans mt1, mt2;
    initial begin
        mt1 = new(.addr(2));
        mt1.address = 4'hF;
        //$display("Last address is: %h", MemTrans::last_address);
        MemTrans::print_last_address();
        mt2 = new(.din(3), .addr(4));
        //$display("Now last address is: %h", MemTrans::last_address);
        MemTrans::print_last_address();
        mt1.print();
        mt1.print_all();
        mt2.print();
        mt2.print_all();
        mt2 = null;
    end
endmodule
