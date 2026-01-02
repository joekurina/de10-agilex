// Copyright (C) 2024 Intel Corporation
// SPDX-License-Identifier: MIT

// DE10 Agilex oneAPI ASP RTL Configuration - USM + IO Pipes Variant
// This file defines compile-time options for the ASP hardware with USM and HSSI support

`ifndef ofs_asp_vh
`define ofs_asp_vh

// Include the FIM-generated IP configuration database
`include "ofs_ip_cfg_db.vh"

// Print package parameters during synthesis (debug)
`define PRINT_OFS_ASP_PKG_PARAMETERS_DURING_SYNTHESIS 1

//============================================================
// Host Memory / PCIe Channels
//============================================================
// Enable primary host memory channel (PCIe TLP path)
`define ASP_ENABLE_HOSTMEM_CH_0 1
// Additional channels (disabled for initial bring-up)
//`define ASP_ENABLE_HOSTMEM_CH_1 1
//`define ASP_ENABLE_HOSTMEM_CH_2 1
//`define ASP_ENABLE_HOSTMEM_CH_3 1

//============================================================
// DDR4 Memory Banks
//============================================================
// Enable all 4 DDR4 channels (A/B/C/D)
// These are auto-detected from FIM config via OFS_FIM_IP_CFG_*
`ifdef OFS_FIM_IP_CFG_MEM_SS_EN_MEM_0
    `define ASP_ENABLE_DDR4_BANK_0 1
`elsif OFS_FIM_IP_CFG_LOCAL_MEM_EN_MEM_0
    `define ASP_ENABLE_DDR4_BANK_0 1
`else
    // Fallback: explicitly enable for DE10 Agilex
    `define ASP_ENABLE_DDR4_BANK_0 1
`endif

`ifdef OFS_FIM_IP_CFG_MEM_SS_EN_MEM_1
    `define ASP_ENABLE_DDR4_BANK_1 1
`elsif OFS_FIM_IP_CFG_LOCAL_MEM_EN_MEM_1
    `define ASP_ENABLE_DDR4_BANK_1 1
`else
    `define ASP_ENABLE_DDR4_BANK_1 1
`endif

`ifdef OFS_FIM_IP_CFG_MEM_SS_EN_MEM_2
    `define ASP_ENABLE_DDR4_BANK_2 1
`elsif OFS_FIM_IP_CFG_LOCAL_MEM_EN_MEM_2
    `define ASP_ENABLE_DDR4_BANK_2 1
`else
    `define ASP_ENABLE_DDR4_BANK_2 1
`endif

`ifdef OFS_FIM_IP_CFG_MEM_SS_EN_MEM_3
    `define ASP_ENABLE_DDR4_BANK_3 1
`elsif OFS_FIM_IP_CFG_LOCAL_MEM_EN_MEM_3
    `define ASP_ENABLE_DDR4_BANK_3 1
`else
    `define ASP_ENABLE_DDR4_BANK_3 1
`endif

//============================================================
// DMA Support
//============================================================
// Enable DMA engine for host<->device transfers
`define INCLUDE_ASP_DMA 1
`define ASP_ENABLE_DMA_CH_0 1
// Additional DMA channels (disabled for initial bring-up)
//`define ASP_ENABLE_DMA_CH_1 1
//`define ASP_ENABLE_DMA_CH_2 1
//`define ASP_ENABLE_DMA_CH_3 1

//============================================================
// USM (Unified Shared Memory) Support
//============================================================
// Enable USM for SYCL malloc_shared() / malloc_host()
// Uses VTP (Virtual-to-Physical) translation via intel-fpga-bbb
`define INCLUDE_USM_SUPPORT 1
`define USM_DO_SINGLE_BURST_PARTIAL_WRITES 1
`define ASP_ENABLE_USM_CH_0 1
// Additional USM channels (disabled for initial bring-up)
//`define ASP_ENABLE_USM_CH_1 1
//`define ASP_ENABLE_USM_CH_2 1
//`define ASP_ENABLE_USM_CH_3 1

//============================================================
// Interrupt Configuration
//============================================================
// Kernel completion interrupt (optional)
//`define USE_KERNEL_IRQ 1

// FPGA-to-Host DMA completion IRQ (optional)
//`define USE_F2H_IRQ 1

// Host-to-FPGA DMA completion IRQ
`define USE_H2F_IRQ 1

// Write fence flag (optional)
//`define USE_WR_FENCE_FLAG 1

//============================================================
// Clock Domain Crossing
//============================================================
// Enable PIM's CDC for host-channel AND local memory interfaces
//`define USE_KERNEL_CLK_EVERYWHERE_IN_PR_REGION 1

// Enable PIM's CDC for host-channel only
//`define USE_PIM_CDC_FOR_HOSTCHAN 1

// Enable PIM's CDC for local-memory only
//`define USE_PIM_CDC_FOR_LOCALMEM 1

//============================================================
// Local Memory Write Acknowledgments
//============================================================
// Enable write-acks for kernel-system writes to local memory
// Must match bsp_avmm_write_ack="1" in board_spec.xml
`define USE_WRITEACKS_FOR_KERNELSYSTEM_LOCALMEMORY_ACCESSES 1

//============================================================
// I/O Pipes (HSSI/Ethernet)
//============================================================
// Enable UDP offload engine and I/O channels
// DE10 Agilex has 8x 25GbE channels via QSFP-DD Port A (E-Tile)
`define INCLUDE_IO_PIPES 1

// Enable HSSI ports based on FIM configuration
// The FIM defines INCLUDE_HSSI_PORT_N macros when ports are available
`ifdef INCLUDE_HSSI_PORT_0
    `define ASP_ENABLE_IOPIPE_0 1
`endif
`ifdef INCLUDE_HSSI_PORT_1
    `define ASP_ENABLE_IOPIPE_1 1
`endif
`ifdef INCLUDE_HSSI_PORT_2
    `define ASP_ENABLE_IOPIPE_2 1
`endif
`ifdef INCLUDE_HSSI_PORT_3
    `define ASP_ENABLE_IOPIPE_3 1
`endif
`ifdef INCLUDE_HSSI_PORT_4
    `define ASP_ENABLE_IOPIPE_4 1
`endif
`ifdef INCLUDE_HSSI_PORT_5
    `define ASP_ENABLE_IOPIPE_5 1
`endif
`ifdef INCLUDE_HSSI_PORT_6
    `define ASP_ENABLE_IOPIPE_6 1
`endif
`ifdef INCLUDE_HSSI_PORT_7
    `define ASP_ENABLE_IOPIPE_7 1
`endif

`endif // ofs_asp_vh
