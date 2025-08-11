class alu_driver extends uvm_driver#(seq_item);
  `uvm_component_utils(alu_driver)

  virtual intf intff;
  seq_item seq;

  function new(string name = "alu_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual intf)::get(this, "*", "intff", intff))
      `uvm_fatal("DRIVER", "NO DATA IN THE DRIVER");
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      seq = seq_item::type_id::create("seq");
      seq_item_port.get_next_item(seq);

      intff.a     = seq.a;
      intff.b     = seq.b;
      intff.sel   = seq.sel;
      intff.result= seq.result;

      `uvm_info("DRIVER", $sformatf("A=%0d, B=%0d, SEL=%0d, RESULT=%0d",
                 intff.a, intff.b, intff.sel, intff.result), UVM_MEDIUM)

      seq_item_port.item_done();
    end
  endtask
endclass
