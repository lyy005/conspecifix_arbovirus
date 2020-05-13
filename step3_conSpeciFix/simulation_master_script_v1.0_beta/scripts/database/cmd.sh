nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/testConspecifix/ & 
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/chikv_ConSpeciFix_format_v181219/viral/chikvsizeA/ &
# CHIKV and ONNV (7 genomes)
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run9_combined_CHIKV_ONNE > combined_CHIKV_ONNE.log & 

# CHIKV and EEEV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/combined_CHIKV_EEEV/ > combined_CHIKV_EEEV.log &

# all combined - too diverse no core genes
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/combined_alphavirus > combined_alphavirus.log &
# SFV clade
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run1_combined_SFV > combined_SFV.log &

# SFV clade without BFV NDUV MIDV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run2_combined_SFV_only > combined_SFV_only.log &

# SFV half
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run3_combined_SFV_half > combined_SFV_half.log &

# CHIKV + GETV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run4_combined_CHIKV_GETV > combined_CHIKV_GETV.log &

# CHIKV + EEEV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run5_combined_CHIKV_EEEV/ > combined_CHIKV_EEEV.log &

# recombine strains
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run6_recom_WEEV_FMV_BCV_HJV_SINDV_EEEV > combined_recom_WEEV_FMV_BCV_HJV_SIND_EEEV.log

# CHIKV + VEEV (the most distant virus in the genus)
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run7_combined_CHIKV_VEEV > combined_CHIKV_VEEV.log

# subset of CHIKV
python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run4_combined_CHIKV_MAYV  > combined_CHIKV_MAYV.log

# subset of CHIKV + GETV
python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run8_combined_CHIKV_GETV_subset/  > combined_CHIKV_GETV.log

# CHIKV with location information
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step2_ONNEandCHIKV/conSpecifix_results/run10_combined_CHIKV_withLocation/ > combined_CHIKV_location.log &

# WNV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run18_WNV/ > run18.log & 


