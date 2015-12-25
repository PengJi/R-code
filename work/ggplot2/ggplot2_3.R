library(ggplot2)
library(scales)
#http://f.dataguru.cn/thread-272452-1-1.html
#1.1
# 绘制图层， 并设置坐标
unemp <- ggplot(economics, aes(date, unemploy))
unemp <- unemp + geom_line(xlab = "", ylab = "No. unemployed(1000s)") +
    scale_x_date(breaks = "5 year", labels = date_format("%Y"), limits = as.Date(c("1964-6-30", "2009-06-30"))) +
    scale_y_continuous(breaks = seq(0, 12000, 2000))
unemp
# 加上垂直标记线
pre <- presidential[-(1:3), ]
yrng <- range(economics$unemploy)
xrng <- range(economics$date)
unemp <- unemp + geom_vline(aes(xintercept = as.integer(start)), data = pre)
unemp
# 绘制区块
unemp <- unemp + geom_rect(aes(NULL, NULL, xmin = start, xmax = end,fill = party), ymin = yrng[1], ymax = yrng[2], data = pre,alpha = 0.2) + scale_fill_manual(values=c("blue", "green"))
unemp
# 加上每个对应的文字
last_plot() + geom_text(aes(x = start, y = yrng[1], label = name), data = pre,
                        size = 3, hjust = 0, vjust = 0)

# 1.2
unemp <- ggplot(economics, aes(date, unemploy))
unemp <- unemp + geom_line(xlab = "", ylab = "No. unemployed(1000s)") +
    scale_x_date(breaks = "5 year", labels = date_format("%Y"),
                 limits = as.Date(c("1964-6-30", "2009-06-30"))) +
    scale_y_continuous(breaks = seq(0, 12000, 2000)) 

pre <- presidential[-(1:3), ]
yrng <- range(economics$unemploy)
xrng <- range(economics$date)

caption <- paste(strwrap("Unemployment rates in the US have
                         varied a lot over the years", 40), collapse="\n")
# 添加文字
unemp + geom_text(aes(x, y, label = caption),
                  data = data.frame(x = xrng[2], y = yrng[2]),
                  hjust = 1, vjust = 1, size = 4)
# 标记最高点
highest <- subset(economics, unemploy == max(unemploy))
unemp + geom_point(data = highest, size = 3, colour = "red", alpha = 0.5)

#2
library(maps)
data(us.cities)
p <- ggplot(data = us.cities, aes(x = long, y = lat)) +
    borders("state", size = 0.5) +
    xlim(-120, -70) + ylim(25, 50)

p + geom_point(data = us.cities, aes(size = pop),
               colour = "red", position = "jitter")