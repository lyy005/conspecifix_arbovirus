png('gno2_simulation.png' ,width = 6,
  height    = 6,
  units     = "in",
  res       = 200)
par(mfrow=c(1,1))
tab = read.table('graph_points.txt') # simulation
tab2 = read.table('old_graph_points.txt') # original

plot(tab2$V1,tab2$V2,xlab=c("# Genomes"),ylab=c("h/m"),main='User_spec', col=rgb(0, 0, 0))
points(tab$V1,tab$V2,col=rgb(1, 0, 0,0.5))
abline(h=0.108065507964,col="red", lwd=2, lty=2)
abline(h=0.196154000259,col="red", lwd=1, lty=3)
