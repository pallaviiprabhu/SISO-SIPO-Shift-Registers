module shiftregister(input  clk, reset, data_in,
                    output  serial_out, output [0:3] parallel_out);


//4 cascaded D flip flops withh parallel outputs
    dfr ff0(clk, reset, data_in, parallel_out[0]);
    dfr ff1(clk, reset, parallel_out[0], parallel_out[1]);
    dfr ff2(clk, reset, parallel_out[1], parallel_out[2]);
    dfr ff3(clk, reset, parallel_out[2], parallel_out[3]);

    assign serial_out = parallel_out[3]; //LSB of the register to serial output
endmodule