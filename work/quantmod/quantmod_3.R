#下载某种股票（例如苹果公司股票）在特定时间段内行情数据，
#计算CCI指标，指出买入卖出时机，并评估该指标信号成功率（最好用程序计算而非肉眼观察）
library(quantmod)
tickers <- getSymbols("AAPL",src="yahoo",from ="2014-01-01",to="2014-08-01")
chartSeries(AAPL,name="AAPL CANDLECHART",subset="2014-01-01::2014-7-29",type="candlesticks") 
addCCI()
#产出CCI指标对应的数据值
stocks <-c("high","low","close")
data <-tickers[,2:4]
names(data)<-stocks

#作业
library(quantmod)
tickers <-getSymbols("AAPL",auto.assign = FALSE,from ="2014-01-01",to="2014-08-01")
chartSeries(tickers,name="“AAPL",subset="2014-01-01::2014-7-29",type="candlesticks")
#增减CCI指标
addCCI()
#取出CCI指标对应的数据值
stocks <-c("high","low","close")
data <-tickers[,2:4]
names(data)<-stocks
data
#CCI数据保存在变量cci中
cci<-CCI(data)
#使用第一周讲的Delt()计算变化率，取收盘数据cl()
cl<-Delt(Cl(data))
#关联CCI和DELT数据
result<-cbind(cci,cl)
names(result)<-c("CCI","DELT")
result
#判断逻辑：
#符合-100 ~ 100的CCI的数据，保存在All变量中
All <- result[which(result[,1]>100 |result[,1]< -100)]
head(All)
length(All)
#获取符合CCI>100且DELT>0的数据、及符合CCI<-100且DELT<0的数据，认为该数据是成功的。
pall<- result[which((result[,1]>100 &result[,2] > 0) | (result[,1]< -100 & result[,2] < 0))]
head(pall)
length(pall)
#最后通过计算length(pall)/length(All)*100%，得到成功率。
length(pall)/length(All)


#http://f.dataguru.cn/thread-336087-1-1.html
#加载quantmod包
library(quantmod)
#从互联网上获取股票代码：000790的信息
tickers <-getSymbols("000790.sz",auto.assign = FALSE)
#画蜡烛图
chartSeries(tickers,name="“000790.sz",subset="2014-01-01::2014-7-29",type="candlesticks")
#增加CCI指标
addCCI()
#产出CCI指标对应的数据值
stocks <-c("high","low","close")
data <-tickers[,2:4]
names(data)<-stocks
#CCI数据保存在变量cci中
cci<-CCI(data)
#使用第一周讲的Delt()计算变化率，取收盘数据cl()
cl<-Delt(Cl(data))
#关联CCI和DELT数据
result<-cbind(cci,cl)
names(result)<-c("CCI","DELT")
#判断逻辑：
#符合-100 ~ 100的CCI的数据，保存在All变量中
All <- result[which(result[,1]>100 |result[,1]< -100)]
head(All)
length(All)
#获取符合CCI>100且DELT>0的数据、及符合CCI<-100且DELT<0的数据，认为该数据是成功的。
pall<- result[which((result[,1]>100 &result[,2] > 0) | (result[,1]< -100 & result[,2] < 0))]
head(pall)
length(pall)
#最后通过计算length(pall)/length(All)*100%，得到成功率。
length(pall)/length(All)
