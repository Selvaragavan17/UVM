class alu_environment extends uvm_environment;
  `uvm_components_utils(alu_environment)
  agent agt;
  scoreboard scr;
  
  function new(string name="alu_environment",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt=alu_agent::type_id::create("agt",this);
    scr=alu_scoreboard::type_id::create("scr",this);
  endfunction
  
  function void connect(uvm_phase phase);
    super.connect(phase);
    agt.mon1.item_collected_port.connect(scr.item_collected_export);
  endfunction
endclass
