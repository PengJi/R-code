##画决策树模型--第12-13周作业
library(rpart)
kyphosis
kyphosis.rp = rpart(Kyphosis~.,data=kyphosis,method="class")
plot(kyphosis.rp,uniform=T,branch = 0,margin=0.1,main = "Classification Tree")
text(kyphosis.rp, use.n=T, fancy=T, col="red") 