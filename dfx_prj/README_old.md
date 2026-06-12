This folder contains the Vivado project generation flow for the reconfigurable design.

## How to run

- From the repo root:

```bash
make vivado_dfx_proj -j8
```

- Or from this folder:

```bash
make -C dfx_prj all
# or
./run.sh
```

## What it does

- Executes `scripts/project_gen_reconfig.tcl` (or the project TCL present in this folder) to create a Vivado project.
- The generated project is the one you should open in Vivado if you want to manually change the reconfigurable hardware or export the project TCL for reproducible scripted flows.

If you edit the block design in Vivado, export the project TCL and replace `scripts/project_gen_reconfig.tcl` with that exported TCL so the automated flow matches your GUI changes.
