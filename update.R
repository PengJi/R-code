#旧版本中运行
setwd("d:/r")
olib <- installed.packages()[ ,1]
save(olib, file="oldRpackages")

#可以卸掉旧版本，也可以不卸掉直接在新版中运行
#新版本中运行
setwd("d:/r")
load("oldRpackages")
newip <- installed.packages()[,1]
for(i in setdiff(olib, newip))
    install.packages(i)