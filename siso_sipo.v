// SISO
module shift_reg_siso(input clk, reset, data_in, output data_out);


    wire[2:0]out;
    dfr dfr_0 (clk, reset, data_in, out[0]);
    dfr dfr_1 (clk, reset, out[0], out[1]);
    dfr dfr_2 (clk, reset, out[1],out[2]);
    dfr dfr_3(clk, reset, out[2], data_out);

   // assign data_out = out; 
endmodule

//SIPO
module shift_reg_sipo (input clk, reset, data_in, output [0:3] data_out);

    dfr dfr_0 (clk, reset, data_in, data_out[0]);
    dfr dfr_1 (clk, reset, data_out[0], data_out[1]);
    dfr dfr_2 (clk, reset, data_out[1], data_out[2]);
    dfr dfr_3 (clk, reset, data_out[2], data_out[3]);
endmodule
