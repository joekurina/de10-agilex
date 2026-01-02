# DE10 Agilex oneAPI ASP

oneAPI Accelerator Support Package for DE10 Agilex development kit, based on OFS 2024.2-1.

## Features

- **Device:** Intel Agilex AGFB014R24B2E2V
- **PCIe:** Gen4 x16 via P-Tile (hardware supports Gen4; OPAE driver enables it)
- **Memory:** 4× DDR4-2666 channels, 8 GiB each (32 GiB total)
- **HSSI:** 8x 25GbE via E-Tile to QSFP-DD Port A (available with iopipes variants)
- **oneAPI:** SYCL/DPC++ kernel acceleration

## Board Variants

| Variant | Description |
|---------|-------------|
| `ofs_de10_agilex` | Base DMA-based ASP with local memory (DDR4) |
| `ofs_de10_agilex_usm` | Adds USM (Unified Shared Memory) for SYCL malloc_shared()/malloc_host() |
| `ofs_de10_agilex_iopipes` | Adds HSSI/IO Pipes for 8x 25GbE networking |
| `ofs_de10_agilex_usm_iopipes` | Full-featured: USM + IO Pipes for networking + shared memory |

## Directory Structure

```
de10-agilex/
├── board_env.xml              # Board environment descriptor
├── hardware/
│   ├── common/                # Shared RTL and scripts
│   ├── ofs_de10_agilex/       # Base variant
│   ├── ofs_de10_agilex_usm/   # USM variant
│   ├── ofs_de10_agilex_iopipes/      # IO Pipes variant
│   └── ofs_de10_agilex_usm_iopipes/  # USM + IO Pipes variant
├── scripts/
│   └── build-asp.sh           # Main build script
└── README.md                  # This file
```

## Prerequisites

1. **Quartus Prime Pro 24.1** with Agilex device support
2. **OFS 2024.2-1** (ofs-agx7-pcie-attach)
3. **oneAPI Base Toolkit 2024.2** or later
4. **OPAE SDK 2.12.0** or later
5. **RHEL 8.8** (validated platform)

## Building the ASP

### Step 1: Build the OFS FIM

First, build the DE10 Agilex FIM:

```bash
cd ofs-agx7-pcie-attach
export OFS_ROOTDIR=$PWD

# Build FIM with PR enabled
./ofs-common/scripts/common/syn/build_top.sh -p de10-agilex de10_agilex.ofss
```

### Step 2: Build the ASP

```bash
cd oneapi-asp/de10-agilex
export OFS_ROOTDIR=<path-to-ofs-agx7-pcie-attach>
export OPAE_SDK_ROOT=/usr/local

./scripts/build-asp.sh
```

### Step 3: Set up oneAPI Environment

```bash
# Set ASP path for oneAPI compiler
export ONEAPI_ASP=<path-to>/oneapi-asp/de10-agilex

# Verify installation
aoc -list-boards
```

## Memory Map

| Bank | Port | Base Address | Size | Description |
|------|------|-------------|------|-------------|
| 0 | kernel_ddr4a | 0x000000000 | 8 GiB | DDR4 Channel A |
| 1 | kernel_ddr4b | 0x200000000 | 8 GiB | DDR4 Channel B |
| 2 | kernel_ddr4c | 0x400000000 | 8 GiB | DDR4 Channel C |
| 3 | kernel_ddr4d | 0x600000000 | 8 GiB | DDR4 Channel D |

## Troubleshooting

### "Board not found" error

Ensure the OPAE driver is loaded and device is detected:

```bash
lspci | grep -i accel
fpgainfo fme
```

### Memory allocation failures

Check available device memory:

```bash
aocl diagnose
```

### Timing failures during compilation

Try reducing kernel clock frequency or enabling aggressive optimization:

```bash
aoc -fmax=350 -high-effort kernel.cl
```

## Known Limitations

1. IO Pipes require FIM rebuilt with HSSI enabled (`INCLUDE_HSSI=1`)
2. No HPS integration (not present on this device variant)
3. QSFP-DD Port B not enabled (Port A provides 8× 25GbE)

## References

- [OFS Documentation](https://ofs.github.io)
- [oneAPI FPGA Documentation](https://www.intel.com/content/www/us/en/docs/oneapi/programming-guide/current/fpga-flow.html)
- [DE10 Agilex User Guide](https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=231&No=1450)

## License

SPDX-License-Identifier: MIT






























