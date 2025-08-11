module ALU(
  input logic clk;
  input logic rst;
  input logic [3:0]a,b;
  input logic [2:0]sel;
  output logic [5:0]result);
  
  always@(posedge clk)begin
    if(rst)
      result<=0;
    else
      begin
        case(sel)
          3'b000:result<=a+b;
          3'b001:result<=a|b;
          3'b010:result<=a&b;
          3'b011:result<=a^b;
          3'b100:result<=~(a^b);
          3'b101:result<=~(a&b);
          3'b110:result<=~(a|b);
          3'b111:result<=a+(~b+1);
        endcase
      end
  end
endmodule
  
