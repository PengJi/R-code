#igrap包
#本文链接：http://xccds1977.blogspot.com/
#igraph参考资料：
#官方教学站http://igraph.sourceforge.net/igraphbook/
#官方wiki http://igraph.wikidot.com/
#http://www.stanford.edu/~messing/RforSNA.html

#http://rdatamining.wordpress.com/2012/05/17/an-example-of-social-network-analysis-with-r-using-package-igraph/
#   http://librestats.com/2012/05/17/visualizing-the-cran-graphing-package-dependencies/
#   http://www.surefoss.org/visualisation/when-venn-diagrams-are-not-enough-visualizing-overlapping-data-with-social-network-analysis-in-r/
#   http://www.r-chart.com/2012/05/github-follower-graph-with-r.html
#http://www.statistik.uni-dortmund.de/useR-2008/slides/Csardi.pdf 

#推荐图书：
#introduction to social network methods
#社会网络分析法
#社交网络数据挖掘
library(igraph)
g1 <- graph( c(1,2,2,3,3,4,5,6), directed=FALSE)
plot(gl,layout=layout.circle(gl))
#画星形图
g2 <- graph.star(10, mode = "in")
plot(g2,layout=layout.fruchterman.reingold(g2))
