library(quantmod)
#http://f.dataguru.cn/thread-329890-1-1.html
#http://f.dataguru.cn/thread-326266-1-2.html
#http://f.dataguru.cn/thread-272697-1-1.html

#1)求出Apple公司在2013.1-2013.10的股票总成交量使用
getSymbols("AAPL")
getSymbols("MSFT")
getSymbols("ORCL")
getSymbols("GOOGL")

VOAAPL=sum(Vo(AAPL['2013-01-01::2013-10-30']))#苹果交易量求和
VOAAPL
VOMSFT=sum(Vo(MSFT['2013-01-01::2013-10-30']))#微软交易量求和
VOORCL=sum(Vo(ORCL['2013-01-01::2013-10-30'])) #oracle交易量求和
VOGOOGL=sum(Vo(GOOGL['2013-01-01::2013-10-30'])) #google交易量求和

#2)找出这些股票暴涨暴跌的时间点
#（例如开盘价或收盘价比前一天涨跌幅度超过2%），
#通过搜索引擎寻找是什么原因导致这些暴涨暴跌，
#观察（或用程序分析）数据，看就暴涨暴跌事件是否有可以利用的买卖规律
#用Delt函数求出每天比前一天的收盘价的涨幅
DeltAAPL=Delt(Cl(AAPL['2013-01-01::2013-10-31']))
DeltMSFT=Delt(Cl(MSFT['2013-01-01::2013-10-31']))
DeltORCL=Delt(Cl(ORCL['2013-01-01::2013-10-31']))
DeltGOOG=Delt(Cl(GOOGL['2013-01-01::2013-10-31']))
#收盘价比前一天涨跌幅度超过2%的数据：
VarDeltAAPL=DeltAAPL[abs(DeltAAPL[,1])>0.02]
VarDeltAAPL
VarDeltMSFT=DeltMSFT[abs(DeltMSFT[,1])>0.02]
VarDeltORCL=DeltORCL[abs(DeltORCL[,1])>0.02]
VarDeltGOOG=DeltGOOG[abs(DeltGOOG[,1])>0.02]

#3)截取一段时间内这四家公司股价数据（注意分红派息除权对股价的影响），
#用R中的相关性分析判断股价之间的相关性，
#或者用R基础课程第八周所讲的MIC指标对其进行分析
all=data.frame(AAPL[,1],Op(MSFT),Op(ORCL),Op(GOOGL))
cor(all)
#根据结果发现苹果公司的股票和ORCL公司的股票相关性最强，达到了0.78，属于显著相关