sale<-data.frame(
    X1=c(82.9,88.0,99.9,105.3,117.7,131.0,148.2,161.8,174.2,184.7),
    X2=c(92,93,96,94,100,101,105,112,112,112),
    X3=c(17.1,21.3,25.1,29.0,34.0,40.0,44.0,49.0,51.0,53.0),
    X4=c(94,96,97,97,100,101,104,109,111,111),
    Y=c(8.4,9.6,10.4,11.4,12.2,14.2,15.8,17.9,19.6,20.8)
)
lm.sol<-lm(Y~X1+X2+X3+X4,data=sale) #做线性回归
summary(lm.sol)

#做主成分回归
sale.pr<-princomp(~X1+X2+X3+X4,data=sale,cor=TRUE)
summary(sale.pr,loadings=TRUE)
pre<-predict(sale.pr) #预测样本
sale$Z1<-pre[,1]
sale$Z2<-pre[,2]
lm.sol<-lm(Y~Z1+Z2,data=sale)
summary(lm.sol)

#做变换，得到原坐标系系的关系表达式
beta<-coef(lm.sol)
A<-loadings(sale.pr)
x.bar<-sale.pr$center
x.sd<-sale.pr$scale
coef<-(beta[2]*A[,1]+beta[3]*A[,2])/x.sd
beta0<-beta[1]-sum(x.bar*coef)
c(beta0,coef)
