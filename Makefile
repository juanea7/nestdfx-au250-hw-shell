.PHONY: all generate_bit level2_implementation out_of_context_syn vivado_dfx_proj clean

JOBS ?= 8

all: generate_bit

generate_bit: implementation_A1
	$(MAKE) -C bitstreams all -j$(JOBS)

implementation_A1: vivado_dfx_proj out_of_context_syn
	$(MAKE) -C implementation_A1 all -j$(JOBS)

out_of_context_syn:
	$(MAKE) -C synthesis all -j$(JOBS)

vivado_dfx_proj:
	$(MAKE) -C dfx_prj all -j$(JOBS)

clean:
	$(MAKE) -C bitstreams clean
	$(MAKE) -C implementation_A1 clean
	$(MAKE) -C synthesis clean
	$(MAKE) -C dfx_prj clean
