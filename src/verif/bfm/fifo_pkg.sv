`ifndef AXI4_MASTER_PKG_INCLUDED_
`define AXI4_MASTER_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: axi4_master_pkg
//  Includes all the files related to axi4 master
//--------------------------------------------------------------------------------------------
package fifo_pkg;

  //-------------------------------------------------------
  // Import uvm package
  //-------------------------------------------------------
  `include "uvm_macros.svh"
  import uvm_pkg::*;
 
  // Import axi4_globals_pkg 
  import axi4_globals_pkg::*;

  //-------------------------------------------------------
  // Include all other files
  //-------------------------------------------------------
  `include "write_fifo_seq_item.sv"
  `include "write_sequencer.sv"
  `include "write_driver.sv"
  `include "write_monitor.sv"
  `include "write_agent.sv"
  `include "read_fifo_monitor.sv"
  `include "read_agent.sv"
              
endpackage : fifo_pkg

`endif
