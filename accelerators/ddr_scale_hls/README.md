# DDR Pointer-Model HLS Example

This folder contains a minimal HLS accelerator and testbench for the
"Option 2" architecture:

- AXI4-Lite slave for control
- AXI4 master for DDR reads/writes
- host CPU uses XDMA to fill/read DDR buffers

The example kernel performs:

- `out[i] = in[i] * scale` for `i in [0, length)`

## Files

- `src/ddr_scale_accel.h`: kernel declaration
- `src/ddr_scale_accel.cpp`: HLS kernel implementation and pragmas
- `tb/ddr_scale_accel_tb.cpp`: C testbench for pre-integration validation
- `run_hls.tcl`: Vitis HLS script (`csim`, `csynth`, IP export)

## Interface contract (migration-ready)

The kernel is intentionally written so it can be dropped into the current
hardware template flow:

- `s_axilite bundle=control`
  - `in_ddr` pointer register
  - `out_ddr` pointer register
  - `length`
  - `scale`
  - `ap_start/ap_done/ap_idle/ap_ready` (`ap_ctrl_hs` via return port)

- `m_axi bundle=gmem`
  - single AXI4 master bundle shared by input and output pointers
  - fits the shell-side single AXI full master style

## Run local C simulation (quick check)

```bash
g++ -std=c++11 -O2 -Wall -Wextra -I./src src/ddr_scale_accel.cpp tb/ddr_scale_accel_tb.cpp -o ddr_scale_tb
./ddr_scale_tb
```

## Run Vitis HLS

```bash
vitis_hls -f run_hls.tcl
```

By default, `run_hls.tcl` targets part `xcu250-figd2104-2L-e` and creates
an IP catalog export after synthesis.

## How this maps to software

At runtime, software should:

1. write input data to a DDR buffer through XDMA,
2. program kernel AXI-Lite registers (`in_ddr`, `out_ddr`, `length`, `scale`),
3. set `ap_start`,
4. poll `ap_done` (or wire interrupt later),
5. read output DDR buffer through XDMA.
