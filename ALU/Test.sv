`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"

class alu_test extends uvm_test;
  `uvm_component_utils(alu_test)   

  alu_environment env;
  alu_sequence seq2;

  function new(string name = "alu_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);   
    env  = alu_environment::type_id::create("env", this);
    seq2 = alu_sequence::type_id::create("seq2", this);
  endfunction

  task run_phase(uvm_phase phase);   
    phase.raise_objection(this);     

    repeat (10) begin
      seq2.start(env.agt.seqr);
    end

    phase.drop_objection(this);      
  endtask
endclass
