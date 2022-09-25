interface axi4_interface#(parameter  data_wid   = 64,
		          parameter  adr_wid    = 32,
			  parameter  id_wid     = 8,
			  parameter  len_wid    = 8,
			  parameter  siz_wid    = 3,
			  parameter  bst_wid    = 2,
			  parameter  loc_wid    = 2,
			  parameter  cach_wid   = 2,
			  parameter  prot_wid   = 3,
			  parameter  strb_wid   = (data_wid/8),
			  parameter  rsp_wid    = 2
			  )
			  (input logic clk,rst);
    logic                   ACLK;
    logic                   ARESETn;
    logic                   wr_en;
    logic                   rd_en;
    logic [127:0]           wr_data;
    logic                   AWREADY_a;
    logic                   WREADY_a; 
    logic                   ARREADY_a;
    logic [id_wid-1:0]      RID_a;
    logic [data_wid-1:0]    RDATA_a;	
    logic [rsp_wid-1:0]     RRESP_a; 			
    logic                   RLAST_a; 
    logic                   RVALID_a;
    logic [id_wid-1:0]      BID_a;
    logic [rsp_wid-1:0]     BRESP_a; 			
    logic                   BVALID_a;

    logic [id_wid-1:0]      AWID_a; 
    logic [adr_wid-1:0]     AWADDR_a;
    logic [len_wid-1:0]     AWLEN_a; 				
    logic [siz_wid-1:0]     AWSIZE_a;
    logic [bst_wid-1:0]     AWBURST_a; 
    logic [loc_wid-1:0]     AWLOCK_a; 
    logic [cach_wid-1:0]    AWCACHE_a;
    logic [prot_wid-1:0]    AWPROT_a; 
    logic                   AWVALID_a;
    logic [id_wid-1:0]      ARID_a;
    logic [adr_wid-1:0]     ARADDR_a;
    logic [len_wid-1:0]     ARLEN_a; 				
    logic [siz_wid-1:0]     ARSIZE_a;
    logic [bst_wid-1:0]     ARBURST_a; 
    logic [loc_wid-1:0]     ARLOCK_a;
    logic [cach_wid-1:0]    ARCACHE_a;
    logic [prot_wid-1:0]    ARPROT_a; 
    logic                   ARVALID_a;				 
    logic [id_wid-1:0]      WID_a;
    logic [data_wid-1:0]    WDATA_a; 
    logic [strb_wid-1:0]    WSTRB_a; 
    logic                   WLAST_a;  
    logic                   WVALID_a; 
    logic                   RREADY_a;
    logic                   BREADY_a;
    logic [127:0]           rd_data;    	
    logic                   full;
    logic                   empty;

   //DRIVER CLOCKING BLOCK
   clocking driver_cb@(posedge clk);
   default input #1 output #1;
    output       ACLK;
    output       ARESETn;
    output       wr_en;
    output       rd_en;
    output       wr_data;
    output       AWREADY_a;
    output       WREADY_a; 
    output       ARREADY_a;
    output       RID_a;
    output       RDATA_a;	
    output       RRESP_a; 			
    output       RLAST_a; 
    output       RVALID_a;
    output       BID_a;
    output       BRESP_a; 			
    output       BVALID_a;

    input      AWID_a; 
    input      AWADDR_a;
    input      AWLEN_a; 				
    input      AWSIZE_a;
    input      AWBURST_a; 
    input      AWLOCK_a; 
    input      AWCACHE_a;
    input      AWPROT_a; 
    input      AWVALID_a;
    input      ARID_a;
    input      ARADDR_a;
    input      ARLEN_a; 				
    input      ARSIZE_a;
    input      ARBURST_a; 
    input      ARLOCK_a;
    input      ARCACHE_a;
    input      ARPROT_a; 
    input      ARVALID_a;				 
    input      WID_a;
    input      WDATA_a; 
    input      WSTRB_a; 
    input      WLAST_a;  
    input      WVALID_a; 
    input      RREADY_a;
    input      BREADY_a;
    input      rd_data;    	
    input      full;
    input      empty;
   endclocking

   //MONITOR CLOCKING BLOCK
   clocking monitor_cb@(posedge clk);
   default input #1 output #1;
    input       ACLK;
    input       ARESETn;
    input       wr_en;
    input       rd_en;
    input       wr_data;
    input       AWREADY_a;
    input       WREADY_a; 
    input       ARREADY_a;
    input       RID_a;
    input       RDATA_a;	
    input       RRESP_a; 			
    input       RLAST_a; 
    input       RVALID_a;
    input       BID_a;
    input       BRESP_a; 			
    input       BVALID_a;

    output      AWID_a; 
    output      AWADDR_a;
    output      AWLEN_a; 				
    output      AWSIZE_a;
    output      AWBURST_a; 
    output      AWLOCK_a; 
    output      AWCACHE_a;
    output      AWPROT_a; 
    output      AWVALID_a;
    output      ARID_a;
    output      ARADDR_a;
    output      ARLEN_a; 				
    output      ARSIZE_a;
    output      ARBURST_a; 
    output      ARLOCK_a;
    output      ARCACHE_a;
    output      ARPROT_a; 
    output      ARVALID_a;				 
    output      WID_a;
    output      WDATA_a; 
    output      WSTRB_a; 
    output      WLAST_a;  
    output      WVALID_a; 
    output      RREADY_a;
    output      BREADY_a;
    output      rd_data;    	
    output      full;
    output      empty;
   endclocking

   modport DRIVER (clocking driver_cb,input clk);
   modport MONITOR (clocking monitor_cb,input clk);

endinterface
