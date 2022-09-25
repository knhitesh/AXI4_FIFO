`ifndef WRITE_FIFO_DRIVER_INCLUDED_
`define WRITE_FIFO_DRIVER_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: write_driver
// <Description_here>
//--------------------------------------------------------------------------------------------
`include "write_fifo_seq_item.sv"
class write_driver extends uvm_driver#(write_fifo_seq_item);
  `uvm_component_utils(write_driver)

  //variable intf
  //DEfining virtual interface
  virtual fifo_interface intf;

  //variable pkt
  //Declaring sequence item handle
  write_fifo_seq_item pkt;
  int queue0[$];
  int queue1[$];
  int queue2[$];
  int queue3[$];
  int queue4[$];
  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "write_driver", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  //extern virtual task (string name="write_fifo_seq_item",uvm_object);
endclass : write_driver

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - write_driver
//  parent - parent under which this component is created
//--------------------------------------------------------------------------------------------
function write_driver::new(string name = "write_driver",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

//--------------------------------------------------------------------------------------------
// Function: build_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
function void write_driver::build_phase(uvm_phase phase);
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
function void write_driver::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

  task reset();
    wait(!intf.rst);
    intf.D_in<=0;
    intf.wr<=0;
    intf.rd<=0;
    wait(intf.rst);
  endtask

//--------------------------------------------------------------------------------------------
// Task: run_phase
// <Description_here>
//
// Parameters:
//  phase - uvm phase
//--------------------------------------------------------------------------------------------
task write_driver::run_phase(uvm_phase phase);

    reset();
      forever begin
      pkt=write_fifo_seq_item#(ADDRESS_WIDTH,DATA_WIDTH)::type_id::create("pkt");
      seq_item_port.get_next_item(pkt);
      drive(pkt);
      seq_item_port.item_done();
      pkt.display("DRIVER");
    end
  endtask

  task drive(write_fifo_seq_item pkt);
    bit [127:0] packet;
    @(posedge intf.clk);
    intf.wr<=pkt.awvalid;
    intf.rd<=pkt.arvalid;
    //intf.D_in<=pkt.wdata;
    // Write Address Channel
    
    if(pkt.type_of_axi == 0)
      begin 
        packet = {pkt.sop, pkt.type_of_axi, pkt.awid, pkt.awlen, pkt.awsize, pkt.awburst, pkt.awaddr , pkt.eop};
        queue0.push_back(pkt.awaddr);
      end
// Write Data Channel
    if(pkt.type_of_axi == 1)
      begin 
        packet = {pkt.sop, pkt.type_of_axi, /*pkt.wid,*/ pkt.wstrb, pkt.wdata, pkt.wlast, pkt.eop};
        queue1.push_back(pkt.wdata);
        intf.D_in <= queue1.popfront();
        //queue1.popfront();
      end

// Read Address Channel
    if(pkt.type_of_axi == 2)
      begin 
        packet = {pkt.sop, pkt.type_of_axi, pkt.arid, pkt.arlen, pkt.arsize, pkt.arburst, pkt.araddr, pkt.eop};
        queue2.push_back(pkt.araddr);
      end

// Read Data Channel
   if(pkt.type_of_axi == 3)
     begin
       packet = {pkt.sop, pkt.type_of_axi, pkt.rid, pkt.rresp, pkt.rlast, pkt.rdata , pkt.eop};
       queue3.push_back(pkt.rdata);
     end
// Write Response Channel
   if(pkt.type_of_axi == 4)
     begin 
       packet = {pkt.sop, pkt.type_of_axi, pkt.bid, pkt.bresp, pkt.eop};
       queue4.push_back(pkt.bresp);
     end
endtask : drive

`endif

