#nba球员统计--第12周
nba <- read.csv("nba.csv")
library(RColorBrewer)
rownames(nba)<-nba[,1]
data_matrix<-t(scale(data.matrix(nba[,-1])))
pal=brewer.pal(6,"Blues")
statnames<-c("Games Played", "Minutes Played", "Total Points",
             "Field Goals Made", "Field Goals Attempted",
             "Field Goal Percentage", "Free Throws Made",
             "Free Throws Attempted", "Free Throw Percentage",
             "Three Pointers Made", "Three Pointers Attempted",
             "Three Point Percentage", "Offensive Rebounds",
             "Defensive Rebounds", "Total Rebounds", "Assists", "Steals",
             "Blocks", "Turnovers", "Fouls")
par(mar = c(3,14,19,2),oma=c(0.2,0.2,0.2,0.2),mex=0.5)
#Heat map
image(x=1:nrow(data_matrix),y=1:ncol(data_matrix),
      z=data_matrix,xlab="",ylab="",col=pal,axes=FALSE)
#X axis labels
text(1:nrow(data_matrix), par("usr")[4] + 1,
     srt = 45, adj = 0,labels = statnames,
     xpd = TRUE, cex=0.85)
#Y axis labels
axis(side=2,at=1:ncol(data_matrix),
     labels=colnames(data_matrix),
     col="white",las=1, cex.axis=0.85)
#White separating lines
abline(h=c(1:ncol(data_matrix))+0.5,
       v=c(1:nrow(data_matrix))+0.5,
       col="white",lwd=1,xpd=F)
#Graph Title
text(par("usr")[1]+5, par("usr")[4] + 12,
     "NBA per game performance of top 50corers",
     xpd=TRUE,font=2,cex=1.5)

