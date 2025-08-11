
class alu_environment extends uvm_env;
  `uvm_component_utils(alu_environment)

  alu_agent agt;
  alu_scoreboard scr;
  
  function new(string name = "alu_environment", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = alu_agent::type_id::create("agt", this);
    scr = alu_scoreboard::type_id::create("scr", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon1.item_collected_port.connect(scr.item_collected_import);
  endfunction
endclass
