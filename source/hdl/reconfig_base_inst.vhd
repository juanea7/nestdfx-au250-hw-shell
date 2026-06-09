----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2025 04:26:05 PM
-- Design Name: 
-- Module Name: artico3_base_inst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reconfig_base_inst is
  port (
    M00_AXI_0_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_0_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_arready : in STD_LOGIC;
    M00_AXI_0_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_aruser : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_0_arvalid : out STD_LOGIC;
    M00_AXI_0_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_0_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    M00_AXI_0_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_awready : in STD_LOGIC;
    M00_AXI_0_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    M00_AXI_0_awuser : out STD_LOGIC_VECTOR ( 7 downto 0 );
    M00_AXI_0_awvalid : out STD_LOGIC;
    M00_AXI_0_bready : out STD_LOGIC;
    M00_AXI_0_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_bvalid : in STD_LOGIC;
    M00_AXI_0_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_rlast : in STD_LOGIC;
    M00_AXI_0_rready : out STD_LOGIC;
    M00_AXI_0_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    M00_AXI_0_rvalid : in STD_LOGIC;
    M00_AXI_0_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M00_AXI_0_wlast : out STD_LOGIC;
    M00_AXI_0_wready : in STD_LOGIC;
    M00_AXI_0_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    M00_AXI_0_wvalid : out STD_LOGIC;
    S00_AXI_0_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_0_arready : out STD_LOGIC;
    S00_AXI_0_arvalid : in STD_LOGIC;
    S00_AXI_0_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_0_awready : out STD_LOGIC;
    S00_AXI_0_awvalid : in STD_LOGIC;
    S00_AXI_0_bready : in STD_LOGIC;
    S00_AXI_0_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_0_bvalid : out STD_LOGIC;
    S00_AXI_0_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_rready : in STD_LOGIC;
    S00_AXI_0_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_0_rvalid : out STD_LOGIC;
    S00_AXI_0_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_0_wready : out STD_LOGIC;
    S00_AXI_0_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_0_wvalid : in STD_LOGIC;
    S00_AXI_1_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_1_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_1_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_1_arid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_1_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_1_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_1_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_1_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_1_arready : out STD_LOGIC;
    S00_AXI_1_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_1_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_1_arvalid : in STD_LOGIC;
    S00_AXI_1_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_1_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_1_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_1_awid : in STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_1_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S00_AXI_1_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_1_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_1_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_1_awready : out STD_LOGIC;
    S00_AXI_1_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S00_AXI_1_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_1_awvalid : in STD_LOGIC;
    S00_AXI_1_bid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_1_bready : in STD_LOGIC;
    S00_AXI_1_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_1_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    S00_AXI_1_bvalid : out STD_LOGIC;
    S00_AXI_1_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_1_rid : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S00_AXI_1_rlast : out STD_LOGIC;
    S00_AXI_1_rready : in STD_LOGIC;
    S00_AXI_1_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S00_AXI_1_rvalid : out STD_LOGIC;
    S00_AXI_1_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXI_1_wlast : in STD_LOGIC;
    S00_AXI_1_wready : out STD_LOGIC;
    S00_AXI_1_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S00_AXI_1_wvalid : in STD_LOGIC;
    interrupt : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC
  );
end reconfig_base_inst;

architecture Behavioral of reconfig_base_inst is

  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER of s_axi_aclk: SIGNAL is "ASSOCIATED_BUSIF S00_AXI_0:S00_AXI_1:M00_AXI_0";

begin


end Behavioral;
