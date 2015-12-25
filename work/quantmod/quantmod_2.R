#http://f.dataguru.cn/thread-273661-1-1.html
library(quantmod)
getSymbols("AAPL",src="yahoo",from="2011-01-01",to="2012-12-31")
getSymbols("ORCL",src="yahoo",from="2011-01-01",to="2012-12-31")
getSymbols("GOOGL",src="yahoo",from="2011-01-01",to="2012-12-31")
getSymbols("MSFT",src="yahoo",from="2011-01-01",to="2012-12-31")

candleChart(AAPL,name="Apple candle chart");addADX();      
candleChart(MSFT,name="Microsfot candle chart");addADX();
candleChart(ORCL,name="Oracle candle chart");addADX();
candleChart(GOOGL,name="Google candle chart");addADX();

#苹果股票               
AAPL.adx<-ADX(AAPL)     
AAPL.adx.ad<-AAPL.adx[AAPL.adx[,1]>AAPL.adx[,4] & AAPL.adx[,2]>AAPL.adx[,4]]         
AAPL.adx.ad

#微软股票               
MSFT.adx<-ADX(MSFT)        
MSFT.adx.ad<-MSFT.adx[MSFT.adx[,1]>MSFT.adx[,4] & MSFT.adx[,2]>MSFT.adx[,4]]        

#甲骨文股票               
ORCL.adx<-ADX(ORCL)        
ORCL.adx.ad<-ORCL.adx[ORCL.adx[,1]>ORCL.adx[,4] & ORCL.adx[,2]>ORCL.adx[,4]]        

#谷歌股票               
GOOGL.adx<-ADX(GOOGL)        
GOOGL.adx.ad<-GOOGL.adx[GOOGL.adx[,1]>GOOGL.adx[,4] & GOOGL.adx[,2]>GOOGL.adx[,4]]        
