`ifndef FIFO_BFM_MONITOR_INCLUDED_
`define FIFO_BFM_MONITOR_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: write_monitor
// <Description_here>
//--------------------------------------------------------------------------------------------
class write_monitor extends uvm_monitor;
  `uvm_component_utils(write_monitor)

   //variable intf
   //Defining virtual interface
   virtual fifo_interface intf;

   //variable pkt
   //Instantiating a sequence item packet
   write_fifo_seq_item pkt;

   uvm_analysis_port #(write_fifo_seq_item)item_collected_port;

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "write_monitor", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : write_monitor

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - write_monitor
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function write_monitor::new(string name = "write_monitor",uvm_component parent = null);
  super.new(name, parent);
  item_collected_port=new("item_collected_port",this);

endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void write_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db#(virtual fifo_interface)::get(this,"","vif",intf);
endfunction : build_phase

//--------------------------------------------------------------------------------------------
// Function: connect_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void write_monitor::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task write_monitor::run_phase(uvm_phase phase);

  super.run_phase(phase);
  pkt=write_fifo_seq_item#(ADDRESS_WIDTH,DATA_WIDTH)::type_id::create("pkt");
  @(posedge intf.clk);
  forever begin
  @(posedge intf.clk);
  pkt.wr<=intf.wr;
  pkt.rd<=intf.rd;
  pkt.data_in<=intf.data_in;
  item_collected_port.write(pkt);
  pkt.display("Monitor received the data");
  end

endtask : run_phase

`endif

