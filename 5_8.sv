module test_5_8;
    import chap_5::*;

    initial begin
        //Declare 5 array element of Transaction handles
        Transaction tr_array [5];        
        //Call the generator task to create the objects
        generator(tr_array);
    end

    task generator(Transaction transactions[]);
        foreach(transactions[i]) begin
            transactions[i] = new(.data($random), .address($random));
            transmit(transactions[i]);
        end
    endtask

    task transmit(Transaction tr);
        $display("TRANSMITTING:");
        tr.print();
    endtask
endmodule