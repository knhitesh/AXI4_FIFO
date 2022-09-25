//--------------------------------------------------------------------------------------------
// Module:Top module
//--------------------------------------------------------------------------------------------

module top;

  //-------------------------------------------------------
  // Package : Importing Uvm Pakckage and Test Package
  //-------------------------------------------------------
  import axi4_test_pkg::*;
  import uvm_pkg::*;

  //`include "define.sv"

//--------------------------------
//   Clock 
//------------------------------- 
   bit clock,rst;

   always 
     #10 clock = ~clock;

   initial
     begin
           rst=0;
           #10;
           rst=1;
     end
  /*
  //-------------------   
  // FIFO interface
  //-------------------
    fifo_interface fi0(clock,rst);

  //---------------------
  // FIFO DUT to INTERFACE
  //---------------------
    fifo_dut fdut  (.data_in(fi0.D_in), .wr(fi0.wr), .rd(fi0.rd), .clock(fi0.clock), .rst(fi0.rst), .empty(fi0.empty), .full(fi0.full), .fifo_cnt(fi0.fifo_cnt), .data_out(fi0.D_out));
    // fifo dut(.full(fi0.full),.empty(fi0.empty),.D_in(fi0.D_in),.wr_rd(fi0.wr_rd),.D_out(fi0.D_out),.clock(fi0.clock),.rst(fi0.rst));

  //-------------------
  // AXI interface
  //-------------------  
    axi4_if intf(clock, rst);

  //-----------------------
  // AXI to DUT
  //-----------------------

    axi_dut adut(
      .clock(intf.aclk),
      .rst(intf.aresetn),
   //AXI write address bus-------------------------------------------
      .axs_awid(intf.awid),
      .axs_awaddr(intf.awaddr),
      .axs_awlen(intf.awlen),
      .axs_awsize(intf.awsize),
      .axs_awburst(intf.awburst),
      .axs_awlock(intf.awlock),
      .axs_awcache(intf.awcache),
      .axs_awprot(intf.awprot),
      .axs_awvalid(intf.awvalid),
      .axs_awready(intf.awready),
   //AXI write data bus ---------------------------------------------
      // .axs_wid(intf.wid),
      .axs_wdata(intf.wdata),
      .axs_wstrb(intf.wstrb),   
      .axs_wlast(intf.wlast),   
      .axs_wvalid(intf.wvalid),  
      .axs_wready(intf.wready),  

   //AXI write response bus -----------------------------------------
     .axs_bid(intf.bid),
     .axs_bresp(intf.bresp),
     .axs_bvalid(intf.bvalid),
     .axs_bready(intf.bready),
   
   //AXI read address bus -------------------------------------------
    .axs_arid(intf.arid),
    .axs_araddr(intf.araddr),
    .axs_arlen(intf.arlen),   
    .axs_arsize(intf.arsize),  
    .axs_arburst(intf.arburst), 
    .axs_arlock(intf.arlock),  
    .axs_arcache(intf.arcache), 
    .axs_arprot(intf.arprot),
    .axs_arvalid(intf.arvalid), 
    .axs_arready(intf.arready), 

   //AXI read data bus ----------------------------------------------
    .axs_rid(intf.rid),
    .axs_rdata(intf.rdata),
    .axs_rresp(intf.rresp),
    .axs_rlast(intf.rlast), 
    .axs_rvalid(intf.rvalid),
    .axs_rready(intf.rready));

   //Avalon MM slave bus - for control registers --------------------
   // .avs_waitrequest(intf.avs_waitrequest),
   // .avs_readdata(intf.avs_readdata),
   // .avs_write(intf.avs_write),
   // .avs_read(intf.avs_read),
   // .avs_address(intf.avs_address),
   // .avs_teenable(intf.avs_teenable),
   // .avs_writedata(intf.avs_writedata),
   
   //Avalon_ST	streaming master -------------------------------------		          
    // .aso_data(intf.aso_data),  
    // .aso_valid(intf.aso_valid), 
    // .aso_ready(intf.aso_ready));
  */
  //Handle for the interface connecting the DUT and the testbench
  axi4_interface intf(clk,rst);
 
  //DUT Instantiation
  Project_AXI4_Top dut(
    .clk(intf.clk),
    .rst(intf.rst),
    .ACLK(intf.ACLK),
    .ARESETn(intf.ARESETn),
    .wr_en(intf.wr_en),
    .rd_en(intf.rd_en),
    .wr_data(intf.wr_data),
    .AWREADY_a(intf.AWREADY_a),
    .WREADY_a(intf.WREADY_a), 
    .ARREADY_a(intf.ARREADY_a),
    .RID_a(intf.RID_a),
    .RDATA_a(intf.RDATA_a),	
    .RRESP_a(intf.RRESP_a), 			
    .RLAST_a(intf.RLAST_a), 
    .RVALID_a(intf.RVALID_a),
    .BID_a(intf.BID_a),
    .BRESP_a(intf.BRESP_a), 			
    .BVALID_a(intf.BVALID_a),
    .AWID_a(intf.AWID_a), 
    .AWADDR_a(intf.AWADDR_a),
    .AWLEN_a(intf.AWLEN_a), 				
    .AWSIZE_a(intf.AWSIZE_a),
    .AWBURST_a(intf.AWBURST_a), 
    .AWLOCK_a(intf.AWLOCK_a), 
    .AWCACHE_a(intf.AWCACHE_a),
    .AWPROT_a(intf.AWPROT_a), 
    .AWVALID_a(intf.AWVALID_a),
    .ARID_a(intf.ARID_a),
    .ARADDR_a(intf.ARADDR_a),
    .ARLEN_a(intf.ARLEN_a), 				
    .ARSIZE_a(intf.ARSIZE_a),
    .ARBURST_a(intf.ARBURST_a), 
    .ARLOCK_a(intf.ARLOCK_a),
    .ARCACHE_a(intf.ARCACHE_a),
    .ARPROT_a(intf.ARPROT_a), 
    .ARVALID_a(intf.ARVALID_a),				 
    .WID_a(intf.WID_a),
    .WDATA_a(intf.WDATA_a), 
    .WSTRB_a(intf.WSTRB_a), 
    .WLAST_a(intf.WLAST_a),  
    .WVALID_a(intf.WVALID_a), 
    .RREADY_a(intf.RREADY_a),
    .BREADY_a(intf.BREADY_a),
    .rd_data(intf.rd_data),    	
    .full(intf.full),
    .empty(intf.empty));
//-------------------------------------------------------
// run_test for simulation
//-------------------------------------------------------
  initial begin : START_TEST 

    //setting the virtual interface in config db
    uvm_config_db#(virtual axi4_interface)::set(null,"*","axi4_interface",intf);
    //uvm_config_db #(virtual fifo_interface)::set(null,"*","vif",fi0);
    //uvm_config_db#(virtual axi4_if)::set(null,"*","axi4_if",intf);

    // The test to start is given at the command line
    // The command-line UVM_TESTNAME takes the precedance
    run_test("axi4_base_test");

  end

endmodule :top
