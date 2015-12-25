library(plyr)
#1.1
dlply(mtcars,.(am),colwise(mean))
daply(mtcars, .(am), colwise(mean))
ddply(mtcars, .(am), colwise(mean))

#1.2
a=mtcars
a$type=ifelse(a$wt<=2, "wt<=2", ifelse(a$wt<=4, "2<wt<=4", "wt>4"))

ddply(a, .(type), summarize, mpg.mean = mean(mpg))
daply(a, .(type), summarize, mpg.mean = mean(mpg))
dlply(a, .(type), summarize, mpg.mean = mean(mpg))

#1.3
ddply(a, .(type,am), summarize, mpg.mean = mean(mpg))

#2.1
m=as.matrix(iris[,-5])
m
alply(m,2,mean)
aaply(m,2,mean)
adply(m,2,mean)

#2.2
alply(m,1,mean)
aaply(m,1,mean)
adply(m,1,mean)
