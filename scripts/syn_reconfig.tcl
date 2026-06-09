set file_name reconfig_inst_wrapper
set dcp_file_name reconfig
set top reconfig_base_inst

# Agregar y leer el archivo del IP
open_project ../dfx_prj/reconfig_prj/reconfig.xpr
set_param general.maxThreads  8
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
set logFileId [open ./runLog_$dcp_file_name.log "w"]
set start_time [clock seconds]
set_param general.maxThreads  8 
puts "\[DFX\] generating kernel $file_name"
# Generate output products
generate_target all [get_files *reconfig_base_inst.bd]
# Export IP user files
export_ip_user_files -of_objects [get_files *reconfig_base_inst.bd] -no_script -sync -force -quiet
# Create specific IP run
create_ip_run [get_files -of_objects [get_fileset sources_1] *reconfig_base_inst.bd]
# Launch module run
launch_runs reconfig_base_inst_axi_traffic_gen_0_0_synth_1 \
            reconfig_base_inst_axi_mdata_0_synth_1 \
            reconfig_base_inst_axi_ctrl_0_synth_1 \
            reconfig_base_inst_axi_data_0_synth_1 \
            reconfig_base_inst_axi_timer_0_0_synth_1 \
            reconfig_base_inst_axi_bram_ctrl_0_0_synth_1 \
            reconfig_base_inst_axi_bram_ctrl_0_bram_0_synth_1 -jobs 8
# Wait for module run to finish
wait_on_run reconfig_base_inst_axi_bram_ctrl_0_bram_0_synth_1

synth_design -top $top -part xcu250-figd2104-2L-e -mode out_of_context
write_checkpoint -force ${dcp_file_name}.dcp
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "syn: $total_seconds seconds"
report_utilization -hierarchical > ${top}_utilization.rpt




