class alu_scoreboard extends uvm_scoreboard;
  `uvm_components_utils(alu_scoreboard)
  seq_item seqq[$];
  uvm_analysis_imp #(seq_item,alu_scoreboard)item_collected_import;
  
  
  function new(string name="alu_environment",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_import=new("item_collected_import",this);
  endfunction
  
  function void write(seq_item seq);
    seqq.push_back(seq);
  endfunction
  
  task run_phase(uvm_phase phase);
    seq_item seq1;
    bit check;
    forever begin
      
      wait(seqq.size>0);
      if(seqq.size>0)
        begin
          seq1=seqq.pop_front()
          case(seq1.sel)
            3'b000:check=(seq1.result==(seq1.a+seq1.b));
            3'b001:check=(seq1.result==(seq1.a|seq1.b));
            3'b010:check=(seq1.result==(seq1.a&seq1.b));
            3'b011:check=(seq1.result==(seq1.a^seq1.b));
            3'b100:check=(seq1.result==~(seq1.a^seq1.b));
            3'b101:check=(seq1.result==~(seq1.a&seq1.b));
            3'b110:check=(seq1.result==~(seq1.a|seq1.b));
            3'b111:check=(seq1.result==(seq1.a+(~seq1.b+1)));
          endcase
          if(check)begin
            `uvm_info( get_type_name(), $sformatf("A=%d B=%d Sel=%b Result=%d",seq1.A,seq1.B,seq1.sel,seq1.Result) , UVM_LOW )
          end
          else
            begin
            `uvm_error( get_type_name(), $sformatf("A=%d B=%d Sel=%b Result=%d",seq1.A,seq1.B,seq1.sel,seq1.Result) )
            end
            
            
        end
    end
  endtask
endclass
                          
