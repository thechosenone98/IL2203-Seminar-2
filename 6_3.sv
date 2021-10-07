module test_6_3;
    import chap_6::*;
    Exercise2 MyEx2;
    initial begin
        repeat(20) begin
            MyEx2 = new;
            assert(MyEx2.randomize())
                else $fatal(0, "MyEx2::randomize failed");
            MyEx2.print_all();
        end
    end
endmodule