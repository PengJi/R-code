#数据展现
library(ggplot2)
#箱线图
nba=read.csv("nba_analysis_13-14.csv",TRUE)
data1 = nba[,c(2,3,4)]#赛次，平均得分，平时失分
data2 = nba[,c(5,6,7)]#投篮命中率，三分命中率，罚球命中率
data3 = nba[,c(8,9,12,13)]#平均篮板，平均助攻，平均失误，平均犯规
data4 = nba[,c(10,11)]#平均盖帽，平均抢断
boxplotpic = function(data,n){ #n:列数
    boxplot(data,main="箱线图",col=rainbow(n),
            notch=T,varwidth=TRUE,medlwd=1, whiskcol="black",staplecol="black",
            outcol="red",cex=0.8,outpch=19)
    grid(nx=NA,ny=NULL,col="gray",lty="dashed")
}
boxplotpic(data1,3)
boxplotpic(data2,3)
boxplotpic(data3,4)
boxplotpic(data4,2)

#点图
library(plyr)
library(reshape)
library(RColorBrewer)
nbasub = nba[-c(1:12),] #去除1~12行
nbasub = nbasub[-c(2:8),]
nbasub = nbasub[-c(3:9),]
nbasub = nbasub[-c(4),]
nbasub #热火，雷霆，马刺
arr = c("热火","雷霆","马刺")
fundotchart = function(data,n,arr){ #data,n：球队个数,arr：球队名字向量
    data=melt(data)
    cols <- brewer.pal(n, "Set1")
    for(i in 1:n){
        data$color[data[,1] == arr[i]] <- cols[i]
    }
    dotchart(data[,3],groups=data[,1],col = data$color,
             pch=19,label=data$variable)
}
fundotchart(nbasub,3,arr)
nbasub1 = nba[1:4,]
nbasub1
fundotchart(nbasub1,4,arr)

#三维散点图
library(scatterplot3d)
scatterplot3d(nba[5:7],type="h",col.axis="blue", col.grid="lightblue",
              highlight.3d=TRUE,pch=20)


#热力图
#第一种
nba1 = nba[,-c(5:7)]
rownames(nba1)<-nba1[,1]
data_matrix<-data.matrix(nba1[,-1])
data_matrix
pal = heat.colors(49)
breaks<-seq(1,100,2)
layout(matrix(data=c(1,2), nrow=1, ncol=2), widths=c(8,1),
       heights=c(1,1))
par(mar = c(3,7,12,2),oma=c(0.2,0.2,0.2,0.2),mex=0.5)
image(x=1:nrow(data_matrix),y=1:ncol(data_matrix),
      z=data_matrix,xlab="",ylab="",breaks=breaks,
      col=pal,axes=FALSE)
text(x=1:nrow(data_matrix)+0.75, y=par("usr")[4] + 1.25,
     srt = 45, adj = 1, labels = rownames(data_matrix),
     xpd = TRUE)
axis(2,at=1:ncol(data_matrix),labels=colnames(data_matrix),
     col="white",las=1)
abline(h=c(1:ncol(data_matrix))+0.5,v=c(1:nrow(data_matrix))+0.5,
       col="white",lwd=2,xpd=F)
title("nba球队技术统计",line=8,adj=0)
breaks2<-breaks[-length(breaks)]
par(mar = c(25,1,25,7))
image(x=1, y=0:length(breaks2),z=t(matrix(breaks2))*1.001,
      col=pal[1:length(breaks)-1],axes=FALSE,
      breaks=breaks,xlab="",ylab="",xaxt="n")
axis(4,at=0:(length(breaks2)),labels=breaks,col="white",las=1)
abline(h=c(1:length(breaks2)),col="white",lwd=2,xpd=F)
#第二种
nba2 = nba[,-c(1)]
nba2
heatmap(as.matrix(nba2),col = heat.colors(256))

#星图
nba3 = nba[,c(2:4)] #赛次，平均得分，平均失分
nba4 = nba[,c(5:7)] #投篮命中率，三分命中率，罚球命中率
names =c("凯尔特人","篮网","尼克斯","76人","猛龙","骑士","雄鹿","公牛","活塞","步行者",
       "奇才","魔术","热火","老鹰","山猫","快船","国王","太阳","勇士","湖人","雷霆",
       "开拓者","森林狼","爵士","掘金","火箭","灰熊","小牛","马刺","鹈鹕")
stars(nba,full=T,label = names,draw.segment=T,main="所有技术统计")
stars(nba3,full=T,label = names,draw.segment=T,main="赛次，平均得分，平均失分")
stars(nba4,full=T,label = names,draw.segment=T,main="投篮命中率，三分命中率，罚球命中率")

#调和曲线图
source("unison.R")
unison(nba[2:4])


#数据分析
#系统聚类分析
nba2
nba.scale<-scale(nba2)
nba.scale
nba.dist <- dist(nba.scale,method="euclidean") #对数据使用Euclid距离
nba.complete<-hclust(nba.dist,"complete")   #最长距离法做聚类分析
nba.average<-hclust(nba.dist,"average")   #类平均做聚类分析
nba.centroid<-hclust(nba.dist,"centroid")   #重心法做聚类分析
nba.ward<-hclust(nba.dist,"ward")   ####Ward法做聚类分析
par <- par(mfrow=c(2,2))
plot(nba.complete,hang=1,main="Complete Dendrogram")
re.c<-rect.hclust(nba.complete,k=4,border="green")
plot(nba.average,hang=-1,main="Average Dendrogram")
re.a<-rect.hclust(nba.average,k=4,border="blue")
plot(nba.centroid,hang=-1,main="Centroid Dendrogram")
re.o<-rect.hclust(nba.centroid,k=4,border="red")
plot(nba.ward,hang=-1,main="Ward Dendrogram")
re.w<-rect.hclust(nba.ward,k=4,border="gray")

#热力图聚类
dist.e=dist(nba2,method='euclidean')
heatmap(as.matrix(dist.e))
#动态聚类分析
nba.km <- kmeans(nba.scale,4,nstart=20)
nba.km
sort(nba.km$cluster)

#主成分分析
nba.pr <- princomp(nba2,cor=T)
summary(nba.pr,loadings=T) #做主成分分析
p <- predict(nba.pr) #预测数据
p
order(p[,1])
order(p[,2])
order(p[,3])
order(p[,4])
order(p[,5])
order(p[,6])
order(p[,7])
order(p[,8])
order(p[,9])
order(p[,10])
kmeans(scale(p),4)

#因子分析
fa = factanal(~.,factor=7,data=nba2)
fa
