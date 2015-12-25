#课程资源下载本周作业素材，这是某网站在一段时间内的统计指标，每三行为一个单位，分别是时间，ip，pv 
#将数据读入R，然后使用qplot函数用适当而美观的方式展现时间序列变化趋势。
con <- file("lesson8.txt", open="r")
Lines <- readLines("lesson8.txt")
mymatrix  <- matrix(Lines, length(Lines)/3, byrow=TRUE)
mydata <- data.frame(date.Long=mymatrix[,1], ip=as.numeric(mymatrix[,2]), 
                     pv=as.numeric(mymatrix[,3]))
#http://f.dataguru.cn/thread-208182-1-1.html
library("ggplot2")
Sys.setlocale("LC_TIME", "C")
#加载数据
x=scan("lesson8.txt", sep="\n",what=list("","",""))
x
#将list类型的数据集x转换成数据框
H=data.frame('date'=as.character(c(x[1],recursive = TRUE)),
             'ip'=as.numeric(c(x[2],recursive = TRUE)),
             'pv'=as.numeric(c(x[3],recursive = TRUE))) 
#绘图
#绘制IP与PV的关系图
qplot(ip, pv, data = H, geom = c("point", "smooth"),
      method = "lm")
#绘制日期与pv/ip关系图
qplot(as.Date(strptime(as.character(H$date), "%a %b %d")), pv/ip, 
      data = H, geom = "line", main="qplot line",xlab = "Date",
      ylab = "pv/ip")   

#http://www.dataguru.cn/forum.php?mod=viewthread&tid=282794
list<-scan("lesson8.txt",sep="\n",what= list("","",""))

df <- data.frame('date'=as.character(c(list [1],recursive = TRUE)),
                 'ip'=as.numeric(c(list [2],recursive= TRUE)),
                 'pv'=as.numeric(c(list [3],recursive= TRUE)))
Sys.setlocale("LC_TIME", "C")
df$date <- sub(pattern = "HKT ", replacement = "",df$date)
df$date <- as.Date(strptime(df$date, "%a %b %e %H:%M:%S %Y"))
#画图
qplot(date,ip,data=df,geom=c('line','point'),xlab="date",ylab="pv",main="ip~date")
qplot(date,ip,data=df,geom=c('line','point'),colour=ip,xlab="date",ylab="pv",main="ip~date")
qplot(date,pv,data=df,geom=c('line','point'),xlab="date",ylab="pv",main="pv~date")
qplot(date,pv/ip,data=df,geom=c('line','point'),xlab="date",ylab="pv/ip",main="pv/ip~date")

