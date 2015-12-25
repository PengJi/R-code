require(ggplot2)
data(diamonds)
diamonds
set.seed(42)
small <- diamonds[sample(nrow(diamonds), 1000), ]
small
head(small)
summary(small)
#散点图
p <- ggplot(data = small, mapping = aes(x = carat, y = price))
p + geom_point()
p <- ggplot(data = small, mapping = aes(x = carat, y = price, shape = cut))
p + geom_point()
p <- ggplot(data = small, mapping = aes(x = carat, y = price, shape = cut, colour = color))
p + geom_point()
p <- ggplot(small)
p+geom_point(aes(x=carat, y=price, shape=cut, colour=color))
#直方图
ggplot(small) + geom_histogram(aes(x = price))
ggplot(small) + geom_histogram(aes(x = price, fill = cut))
ggplot(small) + geom_histogram(aes(x = price, fill = cut), position = "dodge")
ggplot(small) + geom_histogram(aes(x = price, fill = cut), position = "fill")
#柱状图
ggplot(small) + geom_bar(aes(x = clarity))
ggplot()+geom_bar(aes(x=c(LETTERS[1:3]),y=1:3), stat="identity")
#密度函数图
ggplot(small) + geom_density(aes(x = price))
ggplot(small) + geom_density(aes(x = price, colour = cut))
ggplot(small) + geom_density(aes(x = price, fill = clarity))
#箱式图
ggplot(small) + geom_boxplot(aes(x = cut, y = price, fill = color))

#标尺
ggplot(small) + geom_point(aes(x = carat, y = price, shape = cut, colour = color)) + 
    scale_y_log10() + scale_colour_manual(values = rainbow(7))

#统计变换
ggplot(small, aes(x = carat, y = price)) + geom_point() + scale_y_log10() + 
    stat_smooth()

#坐标系统
ggplot(small) + geom_bar(aes(x = cut, fill = cut)) + coord_flip()
#极坐标
ggplot(small) + geom_bar(aes(x = factor(1), fill = cut)) + coord_polar(theta = "y")
#靶心图
ggplot(small) + geom_bar(aes(x = factor(1), fill = cut)) + coord_polar()
#风玫瑰图
ggplot(small) + geom_bar(aes(x = clarity, fill = cut)) + coord_polar()

#图层--蝙蝠侠logo
require(ggplot2)
f1 <- function(x) {
    y1 <- 3 * sqrt(1 - (x/7)^2)
    y2 <- -3 * sqrt(1 - (x/7)^2)
    y <- c(y1, y2)
    d <- data.frame(x = x, y = y)
    d <- d[d$y > -3 * sqrt(33)/7, ]
    return(d)
}

x1 <- c(seq(3, 7, 0.001), seq(-7, -3, 0.001))
d1 <- f1(x1)
p1 <- ggplot(d1, aes(x, y)) + geom_point(color = "red") + xlab("") + ylab("") + 
    theme_bw()

x2 <- seq(-4, 4, 0.001)
y2 <- abs(x2/2) - (3 * sqrt(33) - 7) * x2^2/112 - 3 + sqrt(1 - (abs(abs(x2) - 
                                                                        2) - 1)^2)
d2 <- data.frame(x2 = x2, y2 = y2)
p2 <- p1 + geom_point(data = d2, aes(x = x2, y = y2), color = "yellow")

x3 <- c(seq(0.75, 1, 0.001), seq(-1, -0.75, 0.001))
y3 <- 9 - 8 * abs(x3)
d3 <- data.frame(x3 = x3, y3 = y3)
p3 <- p2 + geom_point(data = d3, aes(x = x3, y = y3), color = "green")

x4 <- c(seq(0.5, 0.75, 0.001), seq(-0.75, -0.5, 0.001))
y4 <- 3 * abs(x4) + 0.75
d4 <- data.frame(x4 = x4, y4 = y4)
p4 <- p3 + geom_point(data = d4, aes(x = x4, y = y4), color = "steelblue")

x5 <- seq(-0.5, 0.5, 0.001)
y5 <- rep(2.25, length(x5))
d5 <- data.frame(x5 = x5, y5 = y5)
p5 <- p4 + geom_point(data = d5, aes(x = x5, y = y5))

x6 <- c(seq(-3, -1, 0.001), seq(1, 3, 0.001))
y6 <- 6 * sqrt(10)/7 + (1.5 - 0.5 * abs(x6)) * sqrt(abs(abs(x6) - 1)/(abs(x6) - 
                                                                          1)) - 6 * sqrt(10) * sqrt(4 - (abs(x6) - 1)^2)/14
d6 <- data.frame(x6 = x6, y6 = y6)
p6 <- p5 + geom_point(data = d6, aes(x = x6, y = y6), colour = "blue")

multiplot <- function(..., plotlist = NULL, cols = 1, layout = NULL) {
    plots <- c(list(...), plotlist)
    numPlots = length(plots)
    if (is.null(layout)) {
        layout <- matrix(seq(1, cols * ceiling(numPlots/cols)), ncol = cols, 
                         nrow = ceiling(numPlots/cols))
    }
    if (numPlots == 1) {
        print(plots[[1]])
    } else {
        grid.newpage()
        pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
        for (i in 1:numPlots) {
            matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
            print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row, layout.pos.col = matchidx$col))
        }
    }
}
multiplot(p1, p2, p3, p4, p5, p6, cols = 2)

#分面
ggplot(small, aes(x = carat, y = price)) + geom_point(aes(colour = cut)) + scale_y_log10() + 
    facet_wrap(~cut) + stat_smooth()

#主题
p <- ggplot(small) + geom_boxplot(aes(x = cut, y = price, fill = color))
p + ggtitle("Price vs Cut") + xlab("Cut") + ylab("Price")
require(ggthemes)
p + theme_wsj()
#画囧字的博文
f <- function(x) 1/(x^2 - 1)
x <- seq(-3, 3, by = 0.001)
y <- f(x)
d <- data.frame(x = x, y = y)

p <- ggplot()
p <- p + geom_rect(fill = "white", color = "black", size = 3, aes(NULL, NULL, 
                                                                  xmin = -3, xmax = 3, ymin = -3, ymax = 3, alpha = 0.1))

p <- p + geom_line(data = d, aes(x, y), size = 3) + ylim(-3, 3)
p <- p + theme_bw() + theme(axis.text.x = element_blank(), axis.text.y = element_blank(), 
                            legend.position = "none", panel.grid.minor = element_blank(), panel.grid.major = element_blank(), 
                            panel.background = element_blank(), axis.ticks = element_blank(), panel.border = element_blank())

p + xlab("") + ylab("")

#二维密度图
ggplot(diamonds, aes(carat, price)) + stat_density2d(aes(fill = ..level..), 
 geom = "polygon") + scale_fill_continuous(high = "darkred", low = "darkgreen")

#ggplot2实战
f <- function(a, b, y) a * y * log(y) - 1/b * exp(-(b * y - b/exp(1))^4)

y <- seq(0.001, 1, 0.01)
x1 <- f(3, 30, y)
x2 <- f(2.5, 36, y)
x3 <- f(2, 50, y)

d <- data.frame(x = c(x1, x2, x3), y = rep(y, 3), type = rep(c("alpha=3,    beta=30", 
                                                               "alpha=2.5, beta=36", "alpha=2,    beta=50"), each = length(y)))

p <- ggplot(d, aes(x, y, color = type)) + geom_path()
p + theme_bw() + xlab("") + ylab("") + theme(legend.position = c(0.2, 0.88), 
                                             legend.title = element_blank())
