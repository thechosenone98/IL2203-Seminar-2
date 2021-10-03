module test_5_1();
    class MemTrans;
        logic [7:0] data_in;
        logic [3:0] address;

        function new(input logic [7:0] din=0, addr=0);
            data_in = din;
            address = addr;
        endfunction;

        function void print();
            $display("Address: %h    Data: %h", address, data_in);
        endfunction
    endclass //MemTrans

    MemTrans mt;
    initial begin
        mt = new(.din(10), .addr(5));
        mt.print();
    end
endmodule
