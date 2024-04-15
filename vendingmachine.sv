module vendingmachine(
  input clk,
  input rst,
  input logic nick_i,
  input logic dime_i,
  input logic quar_i,
  output logic soda_o,
  output logic [2:0] chan_o
  );
  parameter State_0=4'b0000; // 0$
  parameter State_1=4'b0001; // 5$
  parameter State_2=4'b0010; // 10$
  parameter State_3=4'b0011; // 15$
  parameter State_4=4'b0100; // 20$
  parameter State_5=4'b0101; // 25$
  parameter State_6=4'b0110; // 30$
  parameter State_7=4'b0111; // 35$
  parameter State_8=4'b1000; // 40$

  logic [3:0] curr_state;
  logic [3:0] next_state;

  always@(posedge clk)
  begin
    if (rst)
      begin
          curr_state=4'b0000;
          next_state=4'b0000;
      end
    else
      begin
        curr_state = next_state;

        case (curr_state)
          State_0: //0$
            begin
              if(nick_i)      begin next_state = State_1; end
              else if(dime_i) begin next_state = State_2; end
              else if(quar_i) begin next_state = State_5; end
              else            begin next_state = State_0; end
            soda_o <= 1'b0;
            chan_o <= 3'b000;
            end
          State_1: // 5$
            begin
              if(nick_i)      begin next_state = State_2; end
              else if(dime_i) begin next_state = State_3; end
              else if(quar_i) begin next_state = State_6; end
              else            begin next_state = State_1; end
            soda_o <= 1'b0;
            chan_o <= 3'b000;
            end
          State_2: // 10$
            begin
              if(nick_i)        begin next_state = State_3; end
              else if(dime_i)   begin next_state = State_4; end
              else if(quar_i)   begin next_state = State_7; end
              else              begin next_state = State_2; end
            soda_o <= 1'b0;
            chan_o <= 3'b000;
            end
          State_3: // 15$
            begin
              if(nick_i)       begin next_state = State_4; end
              else if(dime_i)  begin next_state = State_5; end
              else if(quar_i)  begin next_state = State_8; end
              else             begin next_state = State_3; end
            soda_o <= 1'b0;
            chan_o <= 3'b000;
            end
          State_4: //20$
            begin
              if(nick_i)        begin next_state = State_1; end
              else if(dime_i)   begin next_state = State_2; end
              else if(quar_i)   begin next_state = State_5; end
              else              begin next_state = State_0; end
            soda_o <= 1'b1;
            chan_o <= 3'b000;
            end
          State_5://25$
            begin
              if(nick_i)      begin next_state = State_1; end
              else if(dime_i) begin next_state = State_2; end
              else if(quar_i) begin next_state = State_5; end
              else            begin next_state = State_0; end 
            soda_o <= 1'b1;
            chan_o <= 3'b001;
            end
          State_6://30$
            begin
              if(nick_i)      begin next_state = State_1; end
              else if(dime_i) begin next_state = State_2; end
              else if(quar_i) begin next_state = State_5; end
              else            begin next_state = State_0; end
            soda_o <= 1'b1;
            chan_o <= 3'b010;
            end
          State_7://35$
            begin
              if(nick_i)      begin next_state = State_1; end
              else if(dime_i) begin next_state = State_2; end
              else if(quar_i) begin next_state = State_5; end
              else            begin next_state = State_0; end
            soda_o <= 1'b1;
            chan_o <= 3'b011;
            end
          State_8://40$
            begin
              if(nick_i)      begin next_state = State_1;end 
              else if(dime_i) begin next_state = State_2;end
              else if(quar_i) begin next_state = State_5;end
              else            begin next_state = State_0;end 
            soda_o <= 1'b1;
            chan_o <= 3'b100;
            end
        endcase
      end
  end
endmodule : vendingmachine
