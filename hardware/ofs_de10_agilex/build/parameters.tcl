# Copyright (C) 2024 Intel Corporation
# SPDX-License-Identifier: MIT

# DE10 Agilex oneAPI ASP Parameters
# Derived from n6001 ASP, adapted for DE10 Agilex memory topology

# AFU UUID - unique identifier for DE10 Agilex ASP
# Format: 128-bit UUID split into high and low 64-bit values
set p_AFU_ID_H {0xDE10A61E00000001}
set p_AFU_ID_L {0x0000000000000001}

# I/O Pipes (HSSI) - available via E-Tile to QSFP-DD, disabled for initial bring-up
set p_IOPIPE_SUPPORT false

# Memory configuration
# DE10 Agilex has 4 DDR4 channels, 8 GiB each
set p_NUMBER_OF_MEMORY_BANKS 4

# Address width: 33 bits for 8 GiB per bank (2^33 = 8 GiB)
set p_MEMORY_BANK_ADDRESS_WIDTH 33

# Data width: 512 bits (64 bytes per transfer)
set p_DATA_WIDTH 512

# Maximum burst size: 16 beats
set p_MAX_BURST_SIZE 16

# Waitrequest allowance for global memory
set p_KERNEL_GLOBALMEM_WAITREQUEST_ALLOWANCE 6

# Snoop port (for cache coherency) - disabled
set p_SNOOP_PORT_ENABLE false

# Pipeline stages from MBD to memory
set p_MBD_TO_MEMORY_PIPE_STAGES 0

# Number of DMA channels
set p_NUMBER_OF_DMA_CHANNELS 1
