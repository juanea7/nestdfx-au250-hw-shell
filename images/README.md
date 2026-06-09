This folder contains the reference diagrams for the shell and the example reconfigurable region.

## Files

- [shell_address_map.png](shell_address_map.png)
- [shell_block_diagram.png](shell_block_diagram.png)
- [reconfig_region_address_map.png](reconfig_region_address_map.png)
- [reconfig_region_block_diagram.png](reconfig_region_block_diagram.png)

## Why they matter

- Use them to confirm the shell-facing interface before changing the reconfigurable hardware.
- Use them to verify the reserved address windows for control, data and interrupt paths.
- Use them to understand the example wiring for the timer, BRAM controller, traffic generator and interrupt aggregation.

## Address map reference

| Area | Base / window | Notes |
| --- | --- | --- |
| Shell control path | `0x8000_0000`, 32 MB window | Shell-facing control/register space. |
| Shell data / master path | `0x4000_0000` | Shell-side master/data mapping shown in the example shell map. |
| Example timer block | `axi_timer_0` at `0x4200_0000`, 64 KB window | Control-side example inside the reconfigurable region. |
| Example BRAM block | `axi_bram_ctrl_0` at `0x8000_0000`, 1 MB window | Example data-side block in the reconfigurable region. |
| Example traffic path | `axi_traffic_gen_0` via M00 AXI | Example full-AXI path in the region diagram. |

## Diagram notes

- The shell diagram shows the static logic, DFX decoupler, shutdown managers, XDMA, DDR4, AXI HBICAP and CMS subsystem.
- The reconfigurable-region diagram shows the example user block structure: AXI SmartConnect for control and data, AXI Timer, AXI BRAM Controller, Block Memory Generator, AXI Traffic Generator, AXI concatenation for interrupts and an external M00 AXI port.

## Practical rule

- Keep the shell-facing interface contract stable. Adapt the reconfigurable project internals and the synthesis run list, but do not change the reserved shell maps unless you are intentionally redesigning the shell.
