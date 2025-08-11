`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "test.sv"

module tp_top;
  bit clk;
  bit rst;
  
  // Instantiate interface
  intf intff(clk, rst);

  // Instantiate DUT
  ALU uut(
    .clk(intff.clk),
    .rst(intff.rst),
    .a(intff.a),
    .b(intff.b),
    .sel(intff.sel),
    .result(intff.result)
  );
  
  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;
  
  // Reset logic
  initial begin
    rst = 1;
    #20 rst = 0;
  end

  // Pass interface handle to UVM testbench
  initial begin
    uvm_config_db#(virtual intf)::set(null, "*", "intff", intff);
  end

  // Run UVM test
  initial begin
    run_test("test");
  end

endmodule
