# Alveo XDMA + HBICAP — Reconfigurable HW Template

This repository provides the hardware half of a reconfigurable Alveo U250 design. It combines a fixed static shell with a user-defined reconfigurable region, and the Makefiles/TCL scripts automate project generation, synthesis, implementation and bitstream/bin creation.

## Key features

- Pre-built static shell DCP at [implementation_A0/top_static/top_A0_locked.dcp](implementation_A0/top_static/top_A0_locked.dcp#L1).
- Reconfigurable project template at [scripts/project_gen_reconfig.tcl](scripts/project_gen_reconfig.tcl#L1).
- Automated synthesis and implementation flow driven by the root [Makefile](Makefile#L1).
- Example shell and region address maps and block diagrams in [images/](images/README.md).
- Designed to pair with the companion software template that talks to XDMA, AXI-Lite and HBICAP.

## Repository layout

- [implementation_A0/](implementation_A0/README.md): static shell and locked DCP.
- [dfx_prj/](dfx_prj/README.md): Vivado project generation flow.
- [scripts/](scripts/README.md): TCL scripts for project generation, synthesis and bitstream generation.
- [source/](source/README.md): wrapper and constraint sources for the user design.
- [images/](images/README.md): shell and reconfigurable-region diagrams plus address maps.

## Quick start

1. Open the repo in a Linux environment with Vivado installed.
2. Generate the Vivado project or edit the reconfigurable project TCL for your design.
3. Run the flow from the repo root:

```bash
make -j8
```

This runs `dfx_prj`, `synthesis` and `implementation_A1` to produce the final `.bit` and `.bin` artifacts.

## How to adapt the reconfigurable project

- Use `scripts/project_gen_reconfig.tcl` to create the user project, then open it in Vivado, modify the reconfigurable logic graphically and export the project TCL if you want a reproducible scripted flow.
- Update `scripts/syn_reconfig.tcl` so the `launch_runs` and `wait_on_run` entries match the module runs produced by your design.
- Keep the shell-facing hardware contract stable. The user logic can change, but the ports and reserved address windows expected by the shell should not.

## Hardware contract

The shell expects a stable interface boundary with AXI-Lite control, AXI-full DMA/data, a master port and interrupts. The wrapper that defines this boundary is [source/hdl/reconfig_base_inst.vhd](source/hdl/reconfig_base_inst.vhd#L1).

The shell address windows are predefined, so software and hardware must use the same map. Start from the diagrams in [images/README.md](images/README.md) and keep those ranges fixed unless you are redesigning the shell itself.

## Companion software

There is a separate software template for the userspace side. It uses the same shell contract, address map and bitstream flow, so any hardware change here should be reflected there as well.

## Troubleshooting

- If a build fails, first check the module names in `scripts/syn_reconfig.tcl` and the Vivado block design wiring.
- If addresses do not match, compare the generated project against the diagrams in `images/` before changing the software side.
