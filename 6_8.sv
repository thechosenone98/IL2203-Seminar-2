module test_6_8;
    import chap_6::*;
    Image img;
    initial begin
        img = new;
        assert(img.randomize())
            else $fatal(0, "img::randomize failed");
        img.print_all();
        //Print the number of white pixel contained in the image
        $display("NUM WHITE PIXEL: %0d", img.pixels.sum() with (row.sum() with int'(item)));
    end
endmodule