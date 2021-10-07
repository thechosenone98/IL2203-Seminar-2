package chap_6;
    class Exercise1;
        rand logic [7:0] data;
        rand logic [3:0] address;

        //Constraints
        constraint address_constraint{
            address inside {[3:4]};
        }
    endclass //Exercise1

    class Exercise2;
        rand logic [7:0] data;
        rand logic [3:0] address;

        //Constraints
        constraint data_constraint {
            data == 5;
        }
        constraint address_constraint{
            address dist {0:=10, [1:14]:/80, 15:=10};
        }

        function void print_all;
            $display("Adress: %h\nData: %h", address, data);
        endfunction
    endclass

    class MemTrans
        rand bit rw; //read if rw = 0, write if rw = 1
        rand logic [7:0] data_in;
        rand logic [3:0] address;
        //Constraints
        constraint valid_rw_address {
            (rw == 0)->(address inside {[0:7]});
        }
    endclass


    typedef enum bit { BLACK, WHITE } colors_t;
    parameter PERCENT_WHITE = 20;
    class Image
        rand colors_t pixels[10][10];
        constraint color_constraint{
            foreach (pixels[i,j]) 
                pixels[i][j] dist {
                    BLACK:=100-PERCENT_WHITE, 
                    WHITE := PERCENT_WHITE
                };
        }

        function void print_all;
            foreach (this.pixels[i]) begin
                $write("%2d    ", i);
                foreach (this.pixels[j]) begin
                    $write("%0s ", this.pixels[i][j].name());
                end
                $display;
            end
        endfunction
    endclass;

    class StimData;
        rand int data[];
        //Constraints
        constraint data_constraint{
            data.size() inside {[1:1000]};
        }
    endclass

    typedef enum { READ, WRITE } rw_e;
    class Transaction;
        rw_e old_rw;
        bit[31:0] old_addr;
        rand rw_e rw;
        rand bit [31:0] addr, data;
        constraint rw_constraint{
            if(old_rw == WRITE)
                rw != WRITE;
        }
        constraint addr_constraint{
            if(old_rw == rw)
                old_addr != addr;
        }
        
        function void post_randomize;
            old_rw = rw;
            old_addr = addr;
        endfunction

        function void print_all;
            $display("addr = %d, data = %d, rw = %s", addr, data, rw);
        endfunction
    endclass
endpackage