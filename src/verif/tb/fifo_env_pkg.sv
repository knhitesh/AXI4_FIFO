`ifndef AXI4_MASTER_PKG_INCLUDED_
`define AXI4_MASTER_PKG_INCLUDED_

//--------------------------------------------------------------------------------------------
// Package: fifo_env_pkg
//  Includes all the files related to axi4 master
//--------------------------------------------------------------------------------------------
package fifo_env_pkg;

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
  `include "fifo_scoreboard.sv"
  `include "axi_env.sv"
  
endpackage : fifo_env_pkg

`endif
