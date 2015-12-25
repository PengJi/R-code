#描画亚洲国家的热力地图，标识Adult literacy rate（成人识字率）项指标的直观展现.
#http://f.dataguru.cn/thread-180639-1-2.html
library(sp)
library(rworldmap);
library(gplots);
who = read.csv("WHO.csv",TRUE);
who1= who[who$Continent == '7',]
who2= who1[,c(1,5)]

## 声明地图
map = joinCountryData2Map(who2, joinCode='NAME',
                          nameJoinColumn = "Country", verbose='T');
## 绘制地图
mapParams = mapCountryData(map, nameColumnToPlot = 'Adult.literacy.rate....',
                           mapTitle = '亚洲各国成人识字率（%）',
                           colourPalette = colorpanel(112,low="yellow",mid="#FCC5C0",high="#AE017E"),
                           catMethod = 'categorical',
                           addLegend = FALSE,   # 不显示图例
                           oceanCol = 'lightblue',
                           #missingCountryCol = 'white',
                           mapRegion = "asia",  # 限制亚洲区域
                           borderCol = 'black');
## 添加图例
do.call( addMapLegend, c(mapParams, legendWidth = 0.5,legendMar  = 2,
                         legendIntervals='li',legendLabels="all" ));


#http://f.dataguru.cn/thread-127736-1-2.html
library(sp)
library(rworldmap)
library(gplots)
who.df = read.csv("WHO.csv", TRUE)
who = who.df[,c(1,5)]
#声明地图
map = joinCountryData2Map(who, joinCode='NAME', nameJoinColumn = "Country", verbose='T')
#绘制地图
mapParams = mapCountryData(map, nameColumnToPlot = 'Adult.literacy.rate....',
                           mapTitle = '亚洲各国成人识字率（%）',
                           colourPalette = colorpanel(112, low="yellow", mid="orange", high="red"),
                           catMethod = 'categorical',
                           addLegend = FALSE,   # 不显示图例
                           oceanCol = 'lightblue',
                           mapRegion = "asia",  # 限制亚洲区域
                           borderCol = 'black');
#添加图例
do.call( addMapLegend, c(mapParams, legendWidth = 0.5,legendMar  = 2, legendIntervals='li',legendLabels="all" ))

#交互效果，在地图上通过鼠标点击来显示对应国家名称。
identifyCountries( getMap(), nameColumnToPlot="Adult.literacy.rate...." )

