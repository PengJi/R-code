#画热力图--第12周作业
sales<-read.csv("sales.csv")
library(RColorBrewer)
rownames(sales)<-sales[,1]
sales<-sales[,-1]
class(sales)
data_matrix=data.matrix(sales)
class(data_matrix)
data_matrix
pal=brewer.pal(7,"YlOrRd")
pal
breaks=seq(3000,12000,1500)
breaks
#布局，为图和图例
layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(8,1),heights=c(1,1))
par(mar = c(5,10,4,2),oma=c(0.2,0.2,0.2,0.2),mex=0.5)
#画图
image(x=1:nrow(data_matrix),y=1:ncol(data_matrix),
      z=data_matrix,axes=FALSE,xlab="Month",
      ylab="",col=pal[1:(length(breaks)-1)],
      breaks=breaks,main="Sales Heat Map")
#x轴
axis(1,at=1:nrow(data_matrix),labels=rownames(data_matrix),
     col="white",las=1)
#y轴
axis(2,at=1:ncol(data_matrix),labels=colnames(data_matrix),
     col="white",las=1)
#画分割线
abline(h=c(1:ncol(data_matrix))+0.5,
       v=c(1:nrow(data_matrix))+0.5, col="white",lwd=2,xpd=FALSE)
#减去一列
breaks2<-breaks[-length(breaks)]
breaks2
#画图例
par(mar = c(5,1,4,7))
image(x=1, y=0:length(breaks2),z=t(matrix(breaks2))*1.001,
      col=pal[1:length(breaks)-1],axes=FALSE,breaks=breaks,
      xlab="", ylab="",xaxt="n")
#Error in plot.new() : figure margins too large
axis(4,at=0:(length(breaks2)-1), labels=breaks2, col="white",
     las=1)
abline(h=c(1:length(breaks2)),col="white",lwd=2,xpd=F)
