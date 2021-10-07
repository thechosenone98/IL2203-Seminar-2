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
endpackage