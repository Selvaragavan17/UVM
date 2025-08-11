class alu_agent extends uvm_agent;
  `uvm_components_utils(alu_agent)
  alu_driver drv;
  alu_monitor mon1;
  alu_sequencer seqr;
  
  function new(string name="alu_agent",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  class alu_agent extends uvm_agent;
  `uvm_component_utils(alu_agent)

  alu_driver    drv;
  alu_monitor   mon1;
  alu_sequencer seqr;
  
  function new(string name="alu_agent", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    //if (get_is_active() == UVM_ACTIVE) begin
      drv  = alu_driver::type_id::create("drv", this);
      seqr = alu_sequencer::type_id::create("seqr", this);
   // end

    mon1 = alu_monitor::type_id::create("mon1", this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

    //if (get_is_active() == UVM_ACTIVE) begin
      drv.seq_item_port.connect(seqr.seq_item_export);
    //end
  endfunction

endclass

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    //if(get_is_active() == UVM_ACTIVE ) begin
    drv=alu_driver::type_id::create("drv",this);
    seqr=alu_sequencer::type_id::create("seqr",this);
    //end
    mon1=alu_monitor::type_id::create("mon1",this);
  endfunction
  
  function void connect(uvm_phase phase);
    super.connect(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
    
    
    
