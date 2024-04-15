module vendingmachine_tb();
    reg clk;
    reg rst;
    reg nick_i;
    reg dime_i;
    reg quar_i;
    wire soda_o;
    wire [2:0] chan_o;

    // Instantiate the vendingmachine module
    vendingmachine dut(
        .clk(clk),
        .rst(rst),
        .nick_i(nick_i),
        .dime_i(dime_i),
        .quar_i(quar_i),
        .soda_o(soda_o),
        .chan_o(chan_o)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Testbench
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        nick_i = 0;
        dime_i = 0;
        quar_i = 0;

        // Reset
        rst = 1;
        #10 rst = 0;
        // Test case: Insert 4 nickel
        #10 nick_i = 1;
        #10 nick_i = 0;
      
        #10 nick_i = 1;
        #10 nick_i = 0;
      
        #10 nick_i = 1;
        #10 nick_i = 0;
      
        #10 nick_i = 1;
        #10 nick_i = 0;
        
      //Test case: Insert 2 dime  
        #10 dime_i = 1;
        #10 dime_i = 0;
      
        #10 dime_i = 1;
        #10 dime_i = 0;
        
      //Test case: Insert 2 quarter
        #10 quar_i = 1;
        #10 quar_i = 0;
      
        #10 quar_i = 1;
        #10 quar_i = 0;

      // Test case: Insert 2 nickle + 1 dime
        #10 nick_i = 1;
        #10 nick_i = 0;

        #10 nick_i = 1;
        #10 nick_i = 0;
      
        #10 dime_i = 1;
        #10 dime_i = 0;
      // test case : insert 1 nickle +1 dime+ 1 quarter
        #10 nick_i = 1;
        #10 nick_i = 0;

        #10 dime_i = 1;
        #10 dime_i = 0;
      
        #10 quar_i = 1;
        #10 quar_i = 0;
      
        #10 $finish;
    end
endmodule
