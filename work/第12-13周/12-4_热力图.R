#画热力图
#http://f.dataguru.cn/thread-176704-1-1.html
op <- par(mar = rep(0, 4))   
plot.new()
par(op)
library(RColorBrewer)
who <- read.csv('WHO.csv')
rownames(who) <- who[,1]
who
breaks<-seq(-2.4, 2.4, 0.6)
country <- c('China','Hong Kong, China','Taiwan','Brazil','India','Switzerland','Germany','Japan','Korea, Rep.','Russia','United Kingdom','United States of America')
jet <- c('Stomach_cancer_number_of_new_male_cases','Agricultural_land','CO2_emissions','Cell_phones_total','Energy_use','Forest_area','Roads_paved','Medical_Doctors','Population_growth','Surface_area')
#布局
layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(8,1), heights=c(1,1))
data_matrix<-t(scale(data.matrix(who[country,jet])))
pal=brewer.pal(9,"YlOrRd")
par(mar=c(3,19,24,5),oma=c(0.2,0.2,0.2,0.2),mex=0.5)
#画热力图
image(x=1:nrow(data_matrix),y=1:ncol(data_matrix),z=data_matrix,xlab='',ylab='',col=pal,axes=F)
text(1:nrow(data_matrix),par('usr')[4]+1,srt=45,adj=0,labels=jet,xpd=TRUE,cex=0.85)
axis(side=2,at=1:ncol(data_matrix),labels=colnames(data_matrix),col='white',las=1,cex.axis=0.85)
abline(h=c(1:ncol(data_matrix))+0.5,v=c(1:nrow(data_matrix))+0.5,col='white',lwd=1,xpd=F)
text(par('usr')[1]+5,par('usr')[4]+12,xpd=TRUE,font=2,cex=1.5)
#画图例
par(mar = c(5,1,0,5))
image(x=1, y=0:length(breaks),z=t(matrix(breaks))*1.0001,col=pal[1:length(breaks)-1],axes=FALSE,breaks=breaks,xlab="",ylab="",xaxt="n")
axis(4,at=0:(length(breaks)-1),labels=breaks,col="white",las=1)
abline(h=c(1:length(breaks)),col="white",lwd=2,xpd=F)
