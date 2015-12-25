library(RODBC)
channel <- odbcConnect("songmi",uid="admin",pwd="admin")
sqlTables(channel) #列出数据库里的表
#sqlFetch(channel, "netflowa", rownames = "state") #从数据库读取数据表，并返回一个数据框对象
table1 = sqlQuery(channel, "select * from netflowa limit 1,500") #sql查询
table1
write.csv(table1,"table1.csv") #写入到csv文件中
#sqlDrop(channel, "USArrests") #删除表
#sqlColumns(channel,sqltable) #返回数据库表sqltable列的信息
odbcClose(channel) #关闭连接

#test
table1$firstSeenSrcPort
table1$firstSeenDestPort
table=data.frame(table1$firstSeenSrcPort,table1$firstSeenDestPort)
plot(table)
stem(table$firstSeenSrcPort)
portMatrix=data.
heatmap(as.matrix(table),
        Rowv=NA,
        Colv=NA,
        col = heat.colors(256),
        scale="column",
        margins=c(2,8),
        main = "Car characteristics by Model")
plot(density(table1$firstSeenSrcPort))
plot(density(table1$firstSeenDestPort))

#直方图
hist(table1$firstSeenSrcPort,col="black",border="white",prob=TRUE)
grid(nx=NA,ny=NULL,lty=1,lwd=1,col="gray")
box(bty="l")
lines(density(table1$firstSeenSrcPort,na.rm=T),col="red",lwd=4)

#柱状图
barplot(table(table1$firstSeenSrcPort),col=heat.colors(5))
barplot(table(table1$firstSeenDestPort))

plot(table1$firstSeenSrcPort,type="l",col="blue")
lines(table1$firstSeenDestPort,col="red")

pie(table(table1$firstSeenSrcPort))
pie(table(table1$firstSeenDestPort))
