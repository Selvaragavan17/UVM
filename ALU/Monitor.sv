class alu_monitor extends uvm_monitor;
  `uvm_components_utils(alu_monitor)
  virtual intf intff;
  seq_item seq;
  uvm_analysis_port#(seq_item)item_collected_port;
  
  function new(string name="alu_monitor",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port=new("item_collected_port",this);
    if(!uvm_connfig_db#(virtual intf)::get(this,"*","intff",intff))begin
      `uvm_fatal("MONITOR","NO DATA IN THE MONITOR")
    end
  endfunction
  
  task run_phase(uvm_phase phase);
    seq=new();
    forever begin
      @(posege intff.clk)
      seq.a=intff.a;
      seq.b=intff.b;
      seq.sel=intff.sel;
      seq.result=intff.result;
      `uvm_info("MONITOR","A=%d,B=%d,SEL=%d,RESULT=%D",seq.a,seq.b,seq.sel,seq.result);
      item_collected_port.write(seq);
    end
  endtask
endclass
