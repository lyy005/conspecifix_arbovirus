#/stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run1_YFV
# Step 3
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run1_YFV > step3_YFV.log &

nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run2_YFV_500bp > step3_YFV_500bp.log &

# 200bp
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run3_YFV_200bp > step3_YFV_200bp.log &

# mostly GenotypeII with two Brazil and one Angola genotype
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run4_YFV_200bp_GenotypeII

# test
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run5_YFV_test > step3_YFV_test.log &


# calculate recombination rate
python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run10_YFV_first800bp


# New visualization
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run8_YFV_test_aln_all_800bp/ > run8.log & 

# SPONV
python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run14_SPONV/ > run14.log

# USUV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run15_USUV/ > run15.log &

# ZIKV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run16_ZIKV/ > run16.log &

# ZIKV subsample change sample.py to subsample 21 genomes
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run16_ZIKV_subsample/ > run16b.log &

# ZIKV and SPONV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run17_SPONVandZIKV/ > run17.log &

# SPOV and 1 Asian ZIKV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run17b_SPONVandOneZIKV/ > run17b.log

# SPOV and 1 African ZIKV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run17c_SPONVandOneZIKVafrica > run17c.log

# ZIKV no African samples
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run16b_ZIKV_noAfrica/ > run16b.log &

# WNV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run18_WNV/ > run18.log & 

# DENV1
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run19_DENV1/ > run19.log &

# DENV2
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run20_DENV2 > run20.log &

# DENV3
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run21_DENV3 > run21.log &

# DEN4
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run22_DENV4 > run22.log &

# DENV1 subsample, change sample.py to subsample 25 genomes
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run19_DENV1_subsample > run19b.log &

# DENV2 subsample, change sample.py to subsample 25 genomes
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run20_DENV2_subsample > run20b.log &

# DENV3 subsample, change sample.py to subsample 25 genomes
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run21_DENV3_subsample > run21b.log &

# DENV4 subsample, change sample.py to subsample 25 genomes
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run22_DENV4_subsample > run22b.log &

###
# found the distant error, change distance to 1000 and ortholog to 0.01
###
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run16c_ZIKV_1000and0.01/ > run16b.log &

# WNV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run18c_WNV_1000and0.05/ > run18c.log &

# YFV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run8_YFV_test_aln_all_800bp/ > run8.log &

# YFV and WESSV
nohup python runner_personal.py /stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run25_YFVandWESSV/ > run25.log &
