This folder holds the HDL and constraint sources used by the template flow.

## Key files

- [hdl/reconfig_base_inst.vhd](hdl/reconfig_base_inst.vhd#L1): the wrapper that defines the shell-facing interface boundary.
- [xdc/top.xdc](xdc/top.xdc#L1): top-level constraints used by implementation.

## How to use it

- Add your own HDL sources here and reference them from `scripts/project_gen_reconfig.tcl` or from the Vivado project you generate and export.
- Keep `reconfig_base_inst.vhd` as the stable interface wrapper and build the user logic behind it.
- The shell expects the AXI-Lite, AXI-full, master and interrupt connections to stay compatible.

## Address mapping

- Use [shell_address_map.png](../images/shell_address_map.png) and [reconfig_region_address_map.png](../images/reconfig_region_address_map.png) when wiring the user design so the reserved address windows do not collide.