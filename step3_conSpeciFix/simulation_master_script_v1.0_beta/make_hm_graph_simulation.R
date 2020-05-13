png('gno1_simulation.png' ,width = 6,
  height    = 6,
  units     = "in",
  res       = 200)
par(mfrow=c(1,1))
tab = read.table('graph.txt',h=T) # simulation
tab2 = read.table('old_graph.txt',h=T)  # previous run

# simulations
w=c(tab$Nb,rev(tab$Nb))
v=c(tab$Median-tab$SD,rev(tab$Median + tab$SD))

# origins
w2=c(tab2$Nb,rev(tab2$Nb))
v2=c(tab2$Median-tab2$SD,rev(tab2$Median + tab2$SD))

plot(100,100,cex=0.5,cex.main=0.8,xlim=c(3,max(w2)),ylim=c(0,max(v2) + 0.1),xlab=c("# Genomes"),ylab=c("h/m"),main='User_spec')
polygon(w,v,col=rgb(1, 0, 0,0.5),border=NA)
points(tab$Nb,tab$Median,pch=16,cex=0.3,t="b", col="red")
abline(h=0.108065507964,col="red", lwd=2, lty=2)
abline(h=0.196154000259,col="red", lwd=1, lty=3)

#polygon(w2,v2,col="gray88",border=NA)
polygon(w2,v2,col=rgb(0.88, 0.88, 0.88, 0.5),border=NA)
points(tab2$Nb,tab2$Median,pch=16,cex=0.3,t="b")
