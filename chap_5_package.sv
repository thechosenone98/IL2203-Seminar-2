package chap_5;
    class PrintUtilities;
        function void print_4(input string name,
                              input [3:0] val_4bits);
            $display("%0t: %s = %h", $time, name, val_4bits);
        endfunction
        
        function void print_8(input string name,
                              input [7:0] val_8bits);
            $display("%0t: %s = %h", $time, name, val_8bits);
        endfunction
    endclass //PrintUtilities

    class Statistics;
        time startT;
        static int nTrans = 0;
        static time total_time_elapsed = 0;

        function void start;
            this.startT = $time;
        endfunction

        function void stop;
            time elapsed = $time - startT;
            nTrans++;
            total_time_elapsed += elapsed;
        endfunction

        function Statistics copy;
            copy = new();
            copy.startT = this.startT;
        endfunction
    endclass //Statistics

    class MemTrans;
        PrintUtilities printer;
        Statistics stat;

        static logic [3:0] last_address = 0;

        logic [7:0] data_in;
        logic [3:0] address;

        function new(input logic [7:0] din=0, input logic [3:0] addr=0);
            printer = new();
            stat = new();
            data_in = din;
            address = addr;
            last_address = address;
        endfunction

        static function void print_last_address();
            $display("Last address is: %h", last_address);
        endfunction

        function void print();
            $display("Address: %h    Data: %h", address, data_in);
        endfunction

        function void print_all;
            printer.print_4(.name("Address"), .val_4bits(address));
            printer.print_8(.name("Data"), .val_8bits(data_in));
        endfunction

        function MemTrans copy;
            copy = new();
            copy.address = this.address;
            copy.data_in = this.data_in;
            //We don't really care if the printer handle stays the same since it doesn't have any variable of it's own.
            copy.printer = this.printer;
            //The statistics handle is different since we don't want a modification done on the copy to reflect on this object.
            copy.stat = stat.copy();
        endfunction
    endclass //MemTrans

    class Transaction;
        PrintUtilities printer;

        logic [7:0] data;
        logic [3:0] address;

        function new(input logic [7:0] data, input logic [3:0] address);
            this.printer = new();
            this.data = data;
            this.address = address;
        endfunction

        function void print;
            printer.print_4(.name("Address"), .val_4bits(this.address));
            printer.print_8(.name("Data"), .val_8bits(this.data));
        endfunction
    endclass //Transaction
endpackage