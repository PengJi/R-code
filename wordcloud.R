#安装所需要的包wordcloud
#install.packages('wordcloud')
#加载包
library(wordcloud)
#读取文件，文件中存放有单词及其出现的次数，结构：count,name，下载链接见末尾
mydata <- read.csv('c:/data/word-count.txt',header=T,fileEncoding = 'UTF-8', stringsAsFactors=F)
#查看mydata的前十行

head(mydata)
12
count           name
13
1   527 特种兵之火凤凰
14
2   490           屌丝
15
3   461           韩国
16
4   425           系列
17
5   411         小爸爸
18
6   402           搞笑
#生成颜色向量（数组），从红到蓝，400个
mycolor <- colorRampPalette(c("blue", "red"))(400)
#新建jpeg图片文件，以备后面使用，图片大小是800 x 800像素
jpeg(filename='xxx.jpg', width=800,height=800,units='px')
#画图
wordcloud(mydata$name,mydata$count,c(6,1),random.order=FALSE,color=mycolor)
#清空图片缓冲区，确保图片写入文件中
dev.off()
# http://my.oschina.net/enyo/blog/204298

library(wordcloud)
entropy <- read.csv("entropy.csv",header=T)
head(entropy)
mycolor <- colorRampPalette(c("blue", "red"))(400)
png(filename='entropy.png', width=1000,height=1000,units='px')
wordcloud(entropy$name,entropy$count,c(6,1),random.order=FALSE,color=mycolor)
dev.off()
