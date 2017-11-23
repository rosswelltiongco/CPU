
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name CPU_Execution_Unit -dir "C:/Users/Jesus/Documents/Xilinx_Files/CPU/CPU_Execution_Unit/planAhead_run_1" -part xc7a100tcsg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Jesus/Documents/Xilinx_Files/CPU/CPU_Execution_Unit/top_level_lab7.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Jesus/Documents/Xilinx_Files/CPU/CPU_Execution_Unit} {ipcore_dir} }
add_files [list {ipcore_dir/ram_256x16.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "top_level.ucf" [current_fileset -constrset]
add_files [list {top_level.ucf}] -fileset [get_property constrset [current_run]]
link_design
