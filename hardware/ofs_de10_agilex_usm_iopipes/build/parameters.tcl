# DE10 Agilex oneAPI ASP - USM + IO Pipes Variant Parameters
# AFU ID for usm_iopipes variant: DE10A61E-0000-0004-0000-000000000000
set p_AFU_ID_H {0xDE10A61E00000004}
set p_AFU_ID_L {0x0000000000000000}

# USM (Unified Shared Memory) support enabled
set p_USM_SUPPORT true

# IO Pipes / HSSI support enabled
set p_IOPIPE_SUPPORT true

# Memory configuration - 4x DDR4 banks
set p_NUMBER_OF_MEMORY_BANKS 4
set p_MEMORY_BANK_ADDRESS_WIDTH 33
set p_DATA_WIDTH 512
set p_MAX_BURST_SIZE 16
set p_KERNEL_GLOBALMEM_WAITREQUEST_ALLOWANCE 6
set p_SNOOP_PORT_ENABLE false
set p_MBD_TO_MEMORY_PIPE_STAGES 0
set p_NUMBER_OF_DMA_CHANNELS 1
