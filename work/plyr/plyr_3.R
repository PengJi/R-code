library(plyr)

1.对于R的内置数据集iris，对不同的Species构建Sepal.Length~ Sepal.Width的线性模型并比较三个线性回归模型的拟合效果。
model = function(df) {lm(Sepal.Length ~ Sepal.Width, data = df)}
models = dlply(iris, .(Species), model)

rsq = function(x) summary(x)$r.squared
coefs = ldply(models, function(x) c(coef(x), rsquare = rsq(x)))
names(coefs)[2:3] = c("intercept", "slope")
coefs

require(ggplot2)
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, group=Species, shape=Species, color=Species)) + geom_point() + stat_smooth(method=lm)

2.对于plyr中的数据集baseball，计算每个队伍(team变量)的每一年的人均击球得分，并画出每个队伍的人均击球得分的时间序列图。
library(plyr)
library(ggplot2)
data <- ddply(baseball,.(team,year),colwise(mean,.(ab)))
head(data)
#每个球队一张图
xlim <- range(data$year, na.rm=TRUE)
ylim <- range(data$ab, na.rm=TRUE)
plotpattern <- function(data) {qplot(year, ab, data = data, geom = "line", xlim = xlim, ylim = ylim, ylab=data$team)}
pdf("paths.pdf", width = 8, height = 4)
d_ply(data,.(team), failwith(NA, plotpattern),.print=TRUE)
dev.off()
#所有球队平均击球得分时序图
qplot(year, ab, data = data, color=team ,geom= "line")

http://f.dataguru.cn/thread-288672-1-3.html
http://f.dataguru.cn/thread-292602-1-1.html
http://f.dataguru.cn/thread-288769-1-2.html
http://f.dataguru.cn/thread-291671-1-1.html
