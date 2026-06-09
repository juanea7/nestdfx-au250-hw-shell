This folder contains the static shell artifacts for the A0 region of the design.

## Key file

- [top_static/top_A0_locked.dcp](top_static/top_A0_locked.dcp#L1): the placed-and-routed DCP for the static shell.

## Notes

- The DCP is tied to a specific device and Vivado configuration, so replace it only if you are intentionally rebuilding the shell.
- The user normally does not edit the shell. Instead, adapt the reconfigurable project so it fits the shell-facing AXI, interrupt and address contract.
- Use [shell_block_diagram.png](../images/shell_block_diagram.png) and [shell_address_map.png](../images/shell_address_map.png) as the source of truth for shell wiring and reserved ranges.