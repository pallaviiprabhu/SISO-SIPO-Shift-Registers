// 4-bit shift register with serial-in and both serial-out and parallel-out data capability

//timescale for the testbech
`timescale 1 ns/100 ps

module shift_register_test;
    reg clk;
    reg reset;
    reg data_in;                            //data input
    wire [0:3]parallel_data_out;           //parallel output
    wire serial_data_out;                  // serial output

    // set the reset signal
    initial begin
      reset = 1'b1; #12.5
      reset = 1'b0; #40
      reset = 1'b1; #20
      reset = 1'b0;
    end

    // clk signal
    initial clk = 1'b0; always #5 clk = ~clk;

    //Instantiation of the modules
    initial
        data_in = 0;
        
        shift_register_test shiftregister(clk, reset,data_in,
                                        serial_data_out, parallel_data_out);
        shift_reg_siso siso (clk, reset, data_in, serial_data_out);
        shift_reg_sipo sipo (clk, reset, data_in, parallel_data_out);
    initial begin
        $dumpfile("shift_register.vcd");
        $dumpvars(0,shift_register_test);
    end
    initial begin

        //input of binary 0001 with no reset
      // data_in = 4'b1101;
        #13;data_in = 1; #10;
            data_in = 0; #10;
            data_in = 0; #10;
            data_in = 0; #20;

            //input of 01 while reset is 1
            data_in = 1; #10;
            data_in = 0; #10;

            
            data_in = 1; #10;
            data_in = 0; #10;
            data_in = 1; #10;
            data_in = 0; #50;
        // End the simulation
        $finish;

    end
endmodule

        