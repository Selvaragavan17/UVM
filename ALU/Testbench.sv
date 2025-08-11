`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "test.sv"

module tp_top;
  bit clk;
  bit rst;
  
  intf intff(clk);
  ALU uut(
    .clk(intff.clk);
    .rst(intff.rst);
    .a(intff.a);
    .b(intff.b);
    .sel(intff.sel);
    .result(intff.result));
  
  always #5 clk=~clk;
  
  initial begin
    run_test("test");
    #5000;
    $finish;
  end
  
  initial begin
    rst=0;
  end
  
  initial begin
    uvm_config_db#(virtual intf)::set(null,"","intff",intff);
  end
    
