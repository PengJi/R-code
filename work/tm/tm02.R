#1. 读入课程资源中的data.csv数据集，保存为语料库形式
library("tm")
data<-read.csv("d:/R/data.csv")
docs<-Corpus(DataframeSource(data),readerControl=list(language="zh"))
docs
#2. 修改该语料库创建时间
meta(docs,tag = "datetimestamp") <- "2015-03-20"
meta(docs)
meta(docs[[1]])
#3. 将该语料库中各个文档的作者改为自己的论坛名n=100
for (i in 1:100){meta(docs[[1]],tag="author") <-"jpwangluo"} 
meta(docs[[1]])
