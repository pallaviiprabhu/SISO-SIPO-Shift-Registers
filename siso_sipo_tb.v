// timescale for the testbench
`timescale 1 ns/100 ps
module shift_registers_test;
    reg clk;
    reg reset;
    reg data_in;
    wire [0:3] parallel_data_out;
    wire serial_data_out;

    initial begin
      reset = 1'b1; #12.5
      reset = 1'b0; #40
      reset = 1'b1; #20
      reset = 1'b0;
    end

    initial clk = 1'b0; always #5 clk = ~clk;

    //instantiate both modules
    initial
        data_in = 0;
        shift_reg_siso siso (clk, reset, data_in, serial_data_out);
        shift_reg_sipo sipo (clk, reset, data_in, parallel_data_out);

    initial begin
         $dumpfile("siso_pipo.vcd");
        $dumpvars(0,shift_register_test);

        #13;data_in = 1; #10;
            data_in = 0; #10;
            data_in = 0; #10;
            data_in = 0; #20;

            //input of 01 while reset is 1
            data_in = 1; #10;
            data_in = 0; #10;

            //input of binary number 1010 with no reset
            data_in = 1; #10;
            data_in = 0; #10;
            data_in = 1; #10;
            data_in = 0; #50;
        // End the simulation
        $finish;

    end
endmodule

