.PHONY: all clean

stamp := project_gen.stamp

all: $(stamp)

$(stamp): ../scripts/project_gen_reconfig.tcl run.sh
	./run.sh $<
	touch $@

clean:
	rm -rf $(stamp) *.log *.rpt *.jou .Xil reconfig_prj hd_visual
