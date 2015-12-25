#http://f.dataguru.cn/thread-332703-1-1.html
library(ggplot2)
library(scales)
plot <- qplot(date, psavert, data = economics, geom = "line") +
    ylab("Personal savings rate") +
    geom_hline(xintercept = 0, colour = "grey50")

#plot=qplot(date, psavert, data = economics, geom = "line") + ylab("Personal savings rate")

plot +  scale_x_date(labels=date_format("%Y"),breaks=seq(as.Date("1967-1-1"), as.Date("2007-1-1"),"5 years"),minor_breaks = "1 year") + scale_y_continuous(breaks = c(0, 5, 10))

plot +  scale_x_date(labels=date_format("%Y-%m-%d"),limits = as.Date(c("2004-01-01", "2005-01-01")),minor_breaks = "1 year") + scale_y_continuous(breaks = c(0, 5, 10))

#http://f.dataguru.cn/forum.php?mod=viewthread&tid=300759&pid=1038492&page=1&extra=page%3D1#pid1038492
ggplot(diamonds, aes(x = cut, fill = color)) + geom_bar() + coord_polar()
ggplot(diamonds, aes(x = carat, fill = clarity)) + xlim(0, 2.5) + geom_bar() + coord_polar()
ggplot(diamonds, aes(x = carat, y = price, color =clarity, shape = cut)) + geom_point() + coord_polar()
