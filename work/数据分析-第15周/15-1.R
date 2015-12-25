#http://www.dataguru.cn/thread-127735-1-1.html
library("ggmap")
library("ggplot2")
from = 'tiananmen, beijing'
to = 'yiheyuan, beijing'
path.from = geocode(from)   #起点坐标经纬度
path.to = geocode(to)   #终点坐标经纬度
path = route(from, to, mode = 'driving', structure = 'route')
path.df = data.frame(path$lon, path$lat)
map = get_googlemap( 'beijingligongdaxue', zoom = 12, maptype = 'roadmap', markers = path.df, path = path.df, scale = 2)
ggmap(map, extent = 'panel') + annotate("text",x=116.3974,y=39.90472,label="天安门",col="red",fontface=2) + annotate("text",x=116.2739,y=39.99957,label="颐和园",col="red",fontface=2) + labs(x="Longitude", y="Latitude", title='天安门 到 颐和园')


#http://f.dataguru.cn/thread-184123-1-1.html
library(ggplot2);
library(googleVis);
library(ggmap);
#输出图片到工作目录
png("map path1.png", width = 1024, height=768)
from = 'tiananmen, beijing' #起点；
to = 'yiheyuan, beijing' #终点；
route.from = geocode(from) # 获取起点坐标
route.to = geocode(to) #获取终点坐标
#乘车路线
route.drive = route(from, to, mode = 'driving', structure = 'route')
#走路路线
route.walking= route(from, to, mode = 'walking', structure = 'route') 
route.walking2= data.frame(route.walking$lon, route.walking$lat)
route.drive2 <- data.frame(route.drive$lon, route.drive$lat)
centerlon = (route.from$lon + route.to$lon)/2
centerlat = (route.from$lat + route.to$lat)/2
center <- cbind(lon = centerlon, lat = centerlat)
map.walking= get_googlemap( center, 
                            zoom = 12,
                            maptype='roadmap',
                            path = route.drive2, scale = 2)
location <- ggmap(map.walking, extent = 'panel') + 
    annotate("text",x=route.from[1,1],y=route.from[1,2],label="天安门",col="red",fontface=2) +
    annotate("text",x=route.to[1,1],y=route.to[1,2],label="颐和园",col="red",fontface=2) +
    labs(title='天安门到颐和园路线图')
print(location)
dev.off()

#北京道路地图
map <- get_map(location = 'Beijing', zoom = 10, maptype = 'roadmap')
ggmap(map)

#中国地图
library(ggmap)
library(mapproj)
## Google啊Google给我China的地图数据吧
map <- get_map(location = 'China', zoom = 4)
ggmap(map)

#中国地震可视化数据
library(ggmap)
library(animation)
library(XML)
# 从网页上抓取数据，并进行清理
webpage <-'http://data.earthquake.cn/datashare/globeEarthquake_csn.html'
tables <- readHTMLTable(webpage,stringsAsFactors = FALSE)
raw <- tables[[6]]
data <- raw[-1,c('V1','V3','V4')]
names(data) <- c('date','lan','lon')
data$lan <- as.numeric(data$lan)
data$lon <- as.numeric(data$lon)
data$date <- as.Date(data$date,  "%Y-%m-%d")
# 用ggmap包从google读取地图数据，并将之前的数据标注在地图上。
ggmap(get_googlemap(center = 'china', zoom=4,maptype='terrain'),extent='device')+
    geom_point(data=data,aes(x=lon,y=lan),colour = 'red',alpha=0.7)+
    stat_density2d(aes(x=lon,y=lan,fill=..level..,alpha=..level..),
                   size=2,bins=4,data=data,geom='polygon')+
    opts(legend.position = "none")
