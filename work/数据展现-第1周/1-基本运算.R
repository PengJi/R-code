x=c(1:100)
x
mean(x)
sum(x)
max(x)
min(x)
var(x)
prod(x)
sd(x)

1:10
1:10-1
1:10*2
2:60*2+1

#产生向量
a=2:60*2-1
a
a[1:5]
a[-(1:5)]
a[3:8]
a[a<20]
a[c(2,4,7)]
a[a[3]]

seq(5,20)
seq(5,121,2)
letters[1:30]

#which函数
a=c(2,3,4,2,5,1,6,3,2,5,8,5,7,3)
which.max(a)
which.min(a)
a[which.max(a)]
which(a==2)
which(a>5)
a[which(a>5)]

a=1:20
a
a=c(2,3,4,2,5,1,6,3,2,5,8,7,3)
sort(a)
rev(sort(a))

#matrix
a1=c(1:12)
matrix(a1,nrow=3,ncol=4)
matrix(a1,nrow=4,ncol=3)
matrix(a1,nrow=4,ncol=3,byrow=T)

a=matrix(1:12,nrow=3,ncol=4)
a
t(a)
a=b=matrix(1:12,nrow=3,ncol=4)
a+b
a-b
#矩阵相乘
a=matrix(1:12,nrow=3,ncol=4)
b=matrix(1:12,nrow=4,ncol=3)
a%*%b

a=matrix(1:16,nrow=4,ncol=4)
a
diag(a)
diag(diag(a))
diag(4)
a=matrix(rnorm(16),4,4)
a
solve(a)

#解方程组
a=matrix(rnorm(16),4,4)
a
b=c(1:4)
b
solve(a,b)

#矩阵的特征值与特征向量
a=diag(4)+1
a
a.e=eigen(a,symmetric=T)
a.e

#数据框
x1=c(10,13,45,26,23)
x2=c(20,65,32,27,87)
x=data.frame(x1,x2)
x
x=data.frame("重量"=x1,"运费"=x2)
x
plot(x)

#读文本数据
x=read.table("abc.txt")

#读剪贴板
y=read.table("clipboard",header=F)
#读excel数据
w=read.table("test.prn",header=T)

#循环语句
for(i in 1:59){a[i] = i*2+3}
a
for(i in 1:59){a[i]=i*2+3;b[i]=i*5-4}
b
a[1]=5
i=1
while(a[i]<12){i=i+1;a[i]=a[i-1]+2}
a

#正态分布rnorm()
#泊松分布rpois()
#指数分布rexp()
#Gamma分布函数rgamma()
#均匀分布runif()
#二项分布rbinom()
#几何分布rgeom()

#模拟成绩
x1=round(runif(100,min=80,max=100))
x1
x2=round(rnorm(100,mean=80,sd=7))
x2
x3=round(rnorm(100,mean=83,sd=18))
x3
x3[which(x3>100)]=100
x3
x=data.frame(num,x1,x2,x3)


