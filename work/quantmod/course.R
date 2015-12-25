library(quantmod)

getSymbols("EDU",src="yahoo",from="2014-01-01",to="2014-08-01")
EDU

new.environment <- new.env()
getSymbols("AAPL",env=new.environment,src="yahoo",from="2013-10-01",to="2013-10-23")
ls(envir=new.environment)
get("AAPL",envir=new.environment)

getSymbols("000300.ss",env=new.environment,src="yahoo",from="2014-01-01",to="2014-01-31")
ls(new.environment)
get("000300.SS",envir=new.environment)

getFX("HKD/USD",from="2014-07-01",env=new.environment)
get("HKDUSD",env=new.environment)

getFinancials("AAPL")
viewFinancials(AAPL.f)
get("AAPL",verbose=TRUE)
viewFinancials(AAPL.f)
viewFinancials(AAPL.f,c("CF","IS","BS"),"Q")