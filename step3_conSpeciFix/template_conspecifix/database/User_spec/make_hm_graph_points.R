png('/stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run8b_YFV_1000and0.05_beta_modified_genomes_removed/_conspecifix/database/User_spec/gno2.png' ,width = 6,
  height    = 6,
  units     = "in",
  res       = 200)
par(mfrow=c(1,1))
tab = read.table('/stor/work/Ochman/yli19/projects/conSpeciFix/step3_Flaviviruses/runs/run8b_YFV_1000and0.05_beta_modified_genomes_removed/_conspecifix/database/User_spec/graph_points.txt')
plot(tab$V1,tab$V2,xlab=c("# Genomes"),ylab=c("h/m"),main='User_spec')
abline(h=0.108065507964,col="red", lwd=2, lty=2)
abline(h=0.196154000259,col="red", lwd=1, lty=3)
