`ifndef YSYX_CONFIG_SVH
`define YSYX_CONFIG_SVH
/**
 * Architecture (arch) Parameters
 * @param YSYX_XLEN: Width of an integer register in bits
 * @param YSYX_I_EXTENSION: I Extension
 * @param YSYX_M_EXTENSION: M Extension
 */
`define YSYX_XLEN 32
`define YSYX_I_EXTENSION 'h1
`define YSYX_M_EXTENSION 'h1

/**
 * Microarchitecture (uarch)
 * See ./../ysyx.sv for the pipeline stages.
       +-----+                          +-----+
     ,-| BPU |          |#(IQ_SIZE)  ,-| MUL #(YSYX_M_FAST)
     | +-----+          |    ,------. | +--+--+
  +--|--+    +-----+    +----v+    +--|--+
  | IFU +----> IDU +----> ROU +-----> EXU +-----| #(RS_SIZE)
  +^-|--+    +-----+    ++--+-+     +---^+
   | |                   |  |           |
   | | +-----+      +----v+ |#(RS_SIZE) |
   | `-| L1I #      | WBU |             |
   |   ++----+      +-----+             |
   |    |#(L1I_LINE_LEN, L1I_LEN)       |
   |                                    |
   |           +-----+      +-----+     |
    `----------+ BUS <------> LSU <-----'
               +--^--+      +----|+
  "AXI4 protocol" |              | +-----+
       +----------v----------+   `-| L1D #(L1D_LEN)
       |         SoC         |     +-----+
       +---------------------+

 * uarch Parameters
 * @param YSYX_M_FAST: M Extension Fast Mode (one cycle)
 * @param L1I_LINE_LEN: L1I Line Length
 * @param L1I_LEN: L1I Length (Size)
 * @param IQ_SIZE: Issue Queue Size
 * @param RS_SIZE: Revervation Station Size
 * @param L1D_LEN: L1D Length (Size)
 */

// `define YSYX_M_FAST 'h1
`define YSYX_L1I_LINE_LEN 1
`define YSYX_L1I_LEN 7

`define YSYX_PHT_SIZE 128
`define YSYX_BTB_SIZE 128

`define YSYX_IQ_SIZE 4
`define YSYX_RS_SIZE 4
`define YSYX_SQ_SIZE 8
`define YSYX_ROB_SIZE 4
`define YSYX_L1D_LEN 8

`ifdef YSYX_I_EXTENSION
`define YSYX_REG_LEN 5  // 32 registers
`else
`define YSYX_REG_LEN 4  // 16 registers
`endif

`define YSYX_REG_NUM 2**`YSYX_REG_LEN

// === Architecture (arch) Parameters ===
`endif
