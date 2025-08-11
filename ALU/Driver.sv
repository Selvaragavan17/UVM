class alu_driver extends uvm_driver#(seq_item);
  `uvm_components_utils(alu_driver)
  virtual intf intff;
  seq_item seq;
  
  function new(string name="alu_driver",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_connfig_db#(virtual intf)::get(this,"*","intff",intff))
      `uvm_fatal("DRIVER","NO DATA IN THE DRIVER");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      
      seq_item_port.get_next_item(seq);
      intff.a=seq.a;
      intff.b=seq.b;
      intff.sel=seq.sel;
      intff.result=seq.result;
      `uvm_info("DRIVER","A=%d,B=%d,SEL=%d,RESULT=%D",intff.a,inntff.b,intff.sel,intff.result);
      seq_item_port.item_done(seq);
    end
  endtask
endclass
