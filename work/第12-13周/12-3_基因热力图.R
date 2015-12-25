#相关热力图--第12周
genes<-read.csv("genes.csv")
genes
rownames(genes)<-genes[,1]
genes
data_matrix<-data.matrix(genes[,-1])
data_matrix
pal=heat.colors(5)
pal
breaks<-seq(0,1,0.2)
layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(8,1),
       heights=c(1,1))
#Error in .External.graphics(C_layout, num.rows, num.cols, mat, as.integer(num.figures),  : 
invalid graphics state
par(mar = c(3,7,12,2),oma=c(0.2,0.2,0.2,0.2),mex=0.5)
image(x=1:nrow(data_matrix),y=1:ncol(data_matrix),
      z=data_matrix,xlab="",ylab="",breaks=breaks,
      col=pal,axes=FALSE)
#标定上面的值
text(x=1:nrow(data_matrix)+0.75, y=par("usr")[4] + 1.25,
     srt = 45, adj = 1, labels = rownames(data_matrix),
     xpd = TRUE)
axis(2,at=1:ncol(data_matrix),labels=colnames(data_matrix),
     col="white",las=1)
abline(h=c(1:ncol(data_matrix))+0.5,v=c(1:nrow(data_matrix))+0.5,
       col="white",lwd=2,xpd=F)
title("Correlation between genes",line=8,adj=0)
breaks2<-breaks[-length(breaks)]
# Color Scale
par(mar = c(25,1,25,7))
image(x=1, y=0:length(breaks2),z=t(matrix(breaks2))*1.001,
      col=pal[1:length(breaks)-1],axes=FALSE,
      breaks=breaks,xlab="",ylab="",
      xaxt="n")
#Error in plot.new() : figure margins too large
axis(4,at=0:(length(breaks2)),labels=breaks,col="white",las=1)
abline(h=c(1:length(breaks2)),col="white",lwd=2,xpd=F)