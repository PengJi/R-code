#柱状图
barplot(table(x$x1))
#饼图
pie(table(x$x1))
#箱尾图
boxplot(x$x1,x$x2,x$x3)
#箱线图
boxplot(s[2:4],col=c("red","green","blue"),notch=T)
boxplot(x$x1,x$x2,x$x3,horizontal=T) #水平放置
#星相图
stars(x[c("x1","x2","x3")])
stars(x[c("x1","x2","x3")],full=T,draw.segment=T)
stars(x[c("x1","x2","x3")],full=F,draw.segment=T)
#脸谱图
faces(x[c("x1","x2","x3")])
#茎叶图
stem(x$x1)
#QQ图
#可用于判断是否正态分布
#直线的斜率是标准差，截距是均值
#点的散布越接近直线，则越接近正态分布
qqnorm(x1)
qqline(x1)
qqnorm(x3)
qqnorm(x3)

#散点图
plot(x$x1,x$x2,
     main="数学分析与线性代数成绩的关系",
     xlab="数学分析",
     ylab="线性代数",
     xlim=c(0,100),
     ylim=c(0,100),
     xaxs="i",#set axis style as internal
     yaxs="i",#set axis style as internal
     col="red",
     pch=19
     )

#连线图
a=c(2,3,4,5,6)
b=c(4,7,8,9,12)
plot(a,b,type="l")

#多条曲线的效果
plot(rain$Tokyo,type="l",col="red",
     ylim=c(0,300),
     main="Montyly Rainfail in major cities",
     xlab="Month of Year",
     ylab="Rainfall(mm)",
     lwd=2
     )
lines(rain$NewYork,type="l",col="blue",lwd=2)
lines(rain$London,type="l",col="green",lwd=2)
lines(rain$Berlin,type="l",col="orangle",lwd=2)

#密度图
plot(density(rnorm(1000)))

mtcars #汽车数据集
heatmap(as.matrix(mtcars),
        Rowv=NA,
        Colv=NA,
        col=heat.colors(256),
        scale="column",
        margins=c(2,8),
        main="Car characteristics by Model"
        )

#三维散点图
scatterplot3d(x[2:4])

#三维作图
x<-y<-seq(-2*pi, 2*pi, pi/15)
f<-function(x,y) sin(x)*sin(y)
z<-outer(x, y, f)
contour(x,y,z,col="blue")
persp(x,y,z,theta=30, phi=30, expand=0.7,col="lightblue")

#调和曲线图
#调和曲线图用于聚类判断非常方便

#地图
map("state",interior=FALSE)
map("state",boundary=FALSE,col="red",add=TRUE)
map('world',fill=TRUE,col=heat.color(10))
map("world")