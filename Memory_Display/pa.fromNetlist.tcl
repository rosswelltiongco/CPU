
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name Lab4_Memory_Display_MemoryOnly -dir "/home/rosswell/Documents/301/CPU/Memory/Lab4_Memory_Display_MemoryOnly/planAhead_run_2" -part xc7a100tcsg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/rosswell/Documents/301/CPU/Memory/Lab4_Memory_Display_MemoryOnly/ram.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/rosswell/Documents/301/CPU/Memory/Lab4_Memory_Display_MemoryOnly} {ipcore_dir} }
add_files [list {ipcore_dir/ram_256x16.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "Nexys4DDR_Master.ucf" [current_fileset -constrset]
add_files [list {Nexys4DDR_Master.ucf}] -fileset [get_property constrset [current_run]]
link_design
