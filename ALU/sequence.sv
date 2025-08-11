

class alu_sequence extends uvm_sequence#(seq_item);
  `uvm_object_utils(alu_sequence)
  
  function new(string name = "alu_sequence");
    super.new(name);
  endfunction
  
  task body();
    seq_item seq;
    seq = seq_item::type_id::create("seq");
    
    `uvm_do(seq)
  endtask
endclass
