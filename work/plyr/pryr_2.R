#2.1.1
library(plyr)
disp_per_mpg <-function(disp,mpg,...) disp/mpg
disp_mpg <-splat(disp_per_mpg)(mtcars)
cars <-cbind(vehicle=row.names(mtcars),disp_mpg,mtcars)
arrange(cars,disp_mpg)

#2.1.2
each(min,max,mean,sd)(mtcars$disp)

#2.1.3
rename(x=mtcars,replace=c("hp"="Ghp"))

#2.1.4
count(mtcars,.(am))

#2.2
par_uniform <-data.frame(n=c(20,20,20,20,20),min=c(2,1,1,5,8),max=c(4,2,5,7,9))
mlply(par_uniform,runif)

#2.3
x <- data.frame(k1 = c(NA,NA,3,4,5), k2= c(1,NA,NA,4,5), data = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2= c(NA,NA,3,4,5), data = 1:5)
join(x,y,type="inner")
#只显示x和y中完全匹配的行
join(x,y,type="right")
#显示y的所有行，和x中的匹配列
join(x,y,type="left")
#显示x的所有行，和y中的匹配列
join(x,y,type="full")
#显示和y匹配的x所有行，和y中不与x匹配的行